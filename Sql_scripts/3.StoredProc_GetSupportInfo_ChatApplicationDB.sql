USE ChatApplicationDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shubham Bhardwaj
-- Create date: 31 July 2022
-- Description:	This 
-- =============================================
CREATE OR ALTER PROCEDURE dbo.GetSupportInfo
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
	FROM	[ChatApplicationDB].[dbo].[UserInfo] 
	WHERE	userId = @userId;
	--SELECT @IsEmployee
	

	IF @IsEmployee = 0
		BEGIN
			SELECT		 @Id = SACM.supportId
			FROM		[ChatApplicationDB].[dbo].[SupportAndCustomerMapping]	AS SACM
			INNER JOIN	[ChatApplicationDB].[dbo].[UserInfo]					AS	UI
			ON			UI.userId	= SACM.customerId
			WHERE		UI.userId	= @userId;		
		END
	ELSE IF @IsEmployee = 1
		BEGIN
			SELECT		 @Id = SACM.customerId
			FROM		[ChatApplicationDB].[dbo].[SupportAndCustomerMapping]	AS SACM
			INNER JOIN	[ChatApplicationDB].[dbo].[UserInfo]					AS	UI
			ON			UI.userId	= SACM.supportId
			WHERE		UI.userId	= @userId;	
		END

    -- Get user details
	SELECT	userId
			,email	
			,mobile
			,dob
	FROM	[ChatApplicationDB].[dbo].[UserInfo]
	WHERE userId = 	@Id;
END
GO
