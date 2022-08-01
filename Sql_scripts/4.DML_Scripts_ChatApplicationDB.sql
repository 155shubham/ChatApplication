
/*-----------------------------------------------------------------------------------------------
Description: DML script for ChatApplicationDB
Author: Shubham Bhardwaj
Date: 29th July 2022
------------------------------------------------------------------------------------------------*/
USE ChatApplicationDB;

DELETE FROM dbo.SupportAndCustomerMapping;
DELETE FROM dbo.UserInfo;

-- Insert Customers
INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(11, 'customer1@site1.com', '111122221', 'test', GETDATE(), 'customer', 0)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(12, 'customer2@site2.com', '111122222', 'test', GETDATE(), 'customer', 0)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(13, 'customer3@site3.com', '111122223', 'test', GETDATE(), 'customer', 0)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(14, 'customer4@site1.com', '111122224', 'test', GETDATE(), 'customer', 0)

-- Insert Support guys / Agents (Junior, Midlevel, Senior and TeamLead)
INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(15, 'juniorsupport1@cc.com', '111122225', 'test', GETDATE(), 'Junior', 1)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(16, 'juniorsupport2@cc.com', '111122225', 'test', GETDATE(), 'Junior', 1)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(17, 'juniorsupport3@cc.com', '111122225', 'test', GETDATE(), 'Junior', 1)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(18, 'juniorsupport4@cc.com', '111122225', 'test', GETDATE(), 'Junior', 1)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(19, 'midlevelsupport1@cc.com', '111122225', 'test', GETDATE(), 'MidLevel', 1)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(20, 'midlevelsupport2@cc.com', '111122226', 'test', GETDATE(), 'Midlevel', 1)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(21, 'midlevelsupport3@cc.com', '111122226', 'test', GETDATE(), 'Midlevel', 1)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(22, 'seniorsupport1@cc.com', '111122226', 'test', GETDATE(), 'Senior', 1)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(23, 'seniorsupport2@cc.com', '111122227', 'test', GETDATE(), 'Senior', 1)

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee)
VALUES
	(24, 'teamleadsupport1@cc.com', '111122225', 'test', GETDATE(), 'TeamLead', 1)

INSERT INTO dbo.SupportAndCustomerMapping
	(supportId,customerId)
VALUES
	(15, 11);

select * from dbo.UserInfo;
--select * from dbo.SupportAndCustomerMapping;


SELECT CustomerList.Customer, UI2.email AS Agent
FROM 
	(SELECT		UI.email As Customer, SACM.supportId
	FROM		[ChatApplicationDB].[dbo].[SupportAndCustomerMapping]	AS SACM
	INNER JOIN	[ChatApplicationDB].[dbo].[UserInfo]					AS	UI
	ON			UI.userId	= SACM.customerId) AS CustomerList
INNER JOIN	[ChatApplicationDB].[dbo].[UserInfo] AS UI2
ON			UI2.userId = CustomerList.supportId

GO

