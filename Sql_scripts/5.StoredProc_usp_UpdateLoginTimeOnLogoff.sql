USE ChatApplicationDB;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Author:		Shubham Bhardwaj
-- Create date: 02 August 2022
-- Description:	This is used to update login time on customer/support(agent) logoff.
-- ==========================================================================================
CREATE OR ALTER PROCEDURE dbo.usp_UpdateLoginTimeOnLogoff
(
	@email	VARCHAR(200),
	@userId	INT	
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

	IF (@IsEmployee = 0)
	BEGIN
		IF EXISTS(SELECT 1 FROM dbo.SupportAndCustomerMapping WHERE customerId = @userId)
		BEGIN
			UPDATE dbo.SupportAndCustomerMapping
			SET supportId		= NULL 
			WHERE customerId	= @userId;
		END

		IF EXISTS(SELECT 1 FROM dbo.UserInfo WHERE userId = @userId AND email = @email)
		BEGIN
			UPDATE	dbo.UserInfo
			SET		LoginTime	= NULL
			WHERE	userId		= @userId 
			AND		email		= @email;
		END
	END
	ELSE IF (@IsEmployee = 1)
	BEGIN
		IF EXISTS(SELECT 1 FROM dbo.UserInfo WHERE userId = @userId AND email = @email)
		BEGIN
			UPDATE	dbo.UserInfo
			SET		LoginTime	= NULL, FreeOrBusy = 1
			WHERE	userId		= @userId 
			AND		email		= @email;
		END
	END
END
GO
