USE [ChatApplicationDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-- =============================================
-- Author:		Shubham Bhardwaj
-- Create date: 01 Aug 2022
-- Description:	This is used to update login time and get login information for the user 
				who logs in in the system..
-- =============================================*/
CREATE OR ALTER PROCEDURE [dbo].[usp_UpdateLoginTimeAndGetLoginInfo] 
(
	@email VARCHAR(200),
	@password VARCHAR(200)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE	dbo.UserInfo
	SET		LoginTime = GETDATE()
	WHERE	email = @email AND [password] = @password;
	
	SELECT [userId]
			,[email]
			,[mobile]
			,[IsEmployee]
	FROM dbo.UserInfo
	WHERE email = @email AND [password] = @password;
END
