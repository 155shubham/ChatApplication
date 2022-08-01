USE [ChatApplicationDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shubham Bhardwaj
-- Create date: 31 July 2022
-- Description:	This is used to get support agent for customer and customers for agent.
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[usp_GetSupportAndCustomerMapping]
(
	@userId INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @IsEmployee AS BIT;
	DECLARE @Id AS INT;

	SELECT	@IsEmployee = IsEmployee 
	FROM	[dbo].[UserInfo] 
	WHERE	userId = @userId;

	-- only one support for one customer
	IF (@IsEmployee = 0)
	BEGIN	
		SELECT @Id = supportId FROM dbo.SupportAndCustomerMapping WHERE customerId = @userId;
		IF (@Id IS NOT NULL)
		BEGIN
			SELECT	userId
					, email	
					, mobile
					, dob
			FROM	[dbo].[UserInfo]
			WHERE	userId IN
							(
								SELECT	supportId
								FROM	[dbo].[SupportAndCustomerMapping]
								WHERE	customerId = @userId
							);
		END
		ELSE
		BEGIN
			DECLARE	@supportId AS INT;

			-- Concurrent Chat Capacity
			DECLARE	@oneJuniorCapacity AS INT	= 4;
			DECLARE	@oneMidlevelCapacity AS INT = 6;
			DECLARE	@oneSeniorCapacity AS INT	= 8;
			DECLARE	@oneTeamleadCapacity AS INT	= 5;
			DECLARE	@Capacity AS INT;

			DECLARE @startTime		AS DATETIME;
			DECLARE @currTime		AS DATETIME;
			DECLARE @nightShiftTime AS DATETIME;
			SELECT	@startTime		= convert(varchar(10), '08:00:00', 108)
			SELECT	@currTime		= convert(varchar(10), GETDATE(), 108)
			SELECT	@nightShiftTime = convert(varchar(10), '18:00:00', 108)
			
			-- Agents Not in night shift
			--IF (@currTime < @nightShiftTime AND @currTime >= @startTime)
			--BEGIN
				DECLARE @supportUserCnt AS INT = 0;
				DECLARE @supportUserMappedCnt AS INT = 0;
				DECLARE @supportUserId AS INT;
				DECLARE @roles_count AS INT = 1;
				DECLARE @role AS VARCHAR(100);
				
				WHILE (@roles_count <= 4)
				BEGIN
					IF (@roles_count = 1) SET @role = 'Junior'; SET @Capacity = @oneJuniorCapacity;
					IF (@roles_count = 2) SET @role = 'MidLevel'; SET @Capacity = @oneMidlevelCapacity;
					IF (@roles_count = 3) SET @role = 'Senior'; SET @Capacity = @oneSeniorCapacity;
					IF (@roles_count = 4) SET @role = 'TeamLead'; SET @Capacity = @oneTeamleadCapacity;

					-- Find Juniors first
					SELECT	@supportUserCnt = COUNT(*) 
					FROM	dbo.UserInfo
					WHERE	FreeOrBusy		= 0
					AND		[role]			= @role
					AND		TeamName		NOT IN ('TeamC', 'TeamOverflow')

					IF (@supportUserCnt > 0)
					BEGIN
					SELECT		@supportUserId= MIN(userId)
					FROM		dbo.UserInfo
					WHERE		FreeOrBusy			= 0
					AND			[role]				= @role
					AND			TeamName			NOT IN ('TeamC', 'TeamOverflow');				

					-- Find the junior whose capacity is not more than the defined capacity
					WHILE (@supportUserCnt > 0)
					BEGIN		
						SELECT		@supportUserMappedCnt = Count(*) 
						FROM		dbo.SupportAndCustomerMapping
						WHERE		supportId = @supportUserId;

						print @supportUserMappedCnt;

						IF (@supportUserMappedCnt < @Capacity)
						BEGIN
							SELECT @supportId = @supportUserId;
							SET @supportUserCnt = 0;
							SET @roles_count = 5;
						END
						ELSE IF (@supportUserMappedCnt >= @Capacity)
						BEGIN
							SET @supportUserCnt = @supportUserCnt-1;
							SELECT	@supportUserId= MIN(userId)
							FROM	dbo.UserInfo
							WHERE	FreeOrBusy			= 0
							AND		[role]				= @role
							AND		TeamName			NOT IN ('TeamC', 'TeamOverflow')
							AND		userId > @supportUserId;
						END
					END
				END
				SET @roles_count = @roles_count + 1;
			END
			
			-- When nobody is available in TeamA, TeamB then search in Team Overflow
			IF (@supportId IS NULL)
			BEGIn
				print 'Team Overflow incomplete code'
			END
			--END
		
			-- Agents in night shift
			IF (@currTime >= @nightShiftTime)
			BEGIN
				print 'nightshift incomplete'
			END

			IF EXISTS(SELECT 1 FROM [dbo].[SupportAndCustomerMapping] WHERE customerId = @userId)
			BEGIN
				UPDATE	dbo.SupportAndCustomerMapping
				SET		supportId = @supportId
				WHERE	customerId = @userId;
			END
			ELSE
			BEGIN
				INSERT INTO dbo.SupportAndCustomerMapping (supportId, customerId)
				VALUES (@supportId, @userId)
			END

			SELECT	userId
					, email	
					, mobile
					, dob
			FROM	[dbo].[UserInfo]
			WHERE	userId	= @supportId;
		END		
	END
	-- One or more than one customer for a support guy as per his capacity
	ELSE IF (@IsEmployee = 1)
	BEGIN
		SELECT	userId
				, email	
				, mobile
				, dob
		FROM	[dbo].[UserInfo]
		WHERE	userId IN
						(
							SELECT	customerId
							FROM	[dbo].[SupportAndCustomerMapping]
							WHERE	supportId = @userId
						);
	END
END
