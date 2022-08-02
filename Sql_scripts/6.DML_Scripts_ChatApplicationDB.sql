
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
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(1, 'customer60@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(2, 'customer59@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(3, 'customer58@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(4, 'customer57@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(5, 'customer56@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

	INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(6, 'customer55@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(7, 'customer54@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(8, 'customer53@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(9, 'customer52@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(10, 'customer50@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(11, 'customer1@site1.com', '111122221', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(12, 'customer2@site2.com', '111122222', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(13, 'customer3@site3.com', '111122223', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(14, 'customer4@site1.com', '111122224', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(15, 'customer5@site2.com', '111122225', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(16, 'customer6@site2.com', '111122226', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(17, 'customer7@site3.com', '111122227', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(18, 'customer8@site4.com', '111122228', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(19, 'customer9@site5.com', '111122229', 'test', GETDATE(), 'customer', 0, NULL, 0, NULL);

-- Insert Support guys / Agents (Junior, Midlevel, Senior and TeamLead)
-- Juniors
INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(20, 'juniorsupport1@cc.com', '111122230', 'test', GETDATE(), 'Junior', 1, NULL, 1, 'TeamA');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(21, 'juniorsupport2@cc.com', '111122231', 'test', GETDATE(), 'Junior', 1, NULL, 1, 'TeamB');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(22, 'juniorsupport3@cc.com', '111122231', 'test', GETDATE(), 'Junior', 1, NULL, 1, 'TeamB');

-- Mid Levels
INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(24, 'midlevelsupport1@cc.com', '111122230', 'test', GETDATE(), 'MidLevel', 1, NULL, 1, 'TeamA');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(25, 'midlevelsupport2@cc.com', '111122230', 'test', GETDATE(), 'Midlevel', 1, NULL, 1, 'TeamA');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(26, 'midlevelsupport3@cc.com', '111122231', 'test', GETDATE(), 'Midlevel', 1, NULL, 1, 'TeamB');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(27, 'midlevelsupport4@cc.com', '111122232', 'test', GETDATE(), 'Midlevel', 1, NULL, 1, 'TeamC');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(28, 'midlevelsupport5@cc.com', '111122232', 'test', GETDATE(), 'Midlevel', 1, NULL, 1, 'TeamC');

-- Senior
INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(29, 'seniorsupport1@cc.com', '111122231', 'test', GETDATE(), 'Senior', 1, NULL, 1, 'TeamB');

-- Team Lead
INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(31, 'teamleadsupport1@cc.com', '111122230', 'test', GETDATE(), 'TeamLead', 1, NULL, 1, 'TeamA');

-- Team Overflow
INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(33, 'juniorsupport4@cc.com', '111122233', 'test', GETDATE(), 'Junior', 1, NULL, 1, 'TeamOverflow');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(34, 'juniorsupport5@cc.com', '111122233', 'test', GETDATE(), 'Junior', 1, NULL, 1, 'TeamOverflow');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(35, 'juniorsupport6@cc.com', '111122233', 'test', GETDATE(), 'Junior', 1, NULL, 1, 'TeamOverflow');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(36, 'juniorsupport7@cc.com', '111122233', 'test', GETDATE(), 'Junior', 1, NULL, 1, 'TeamOverflow');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(37, 'juniorsupport8@cc.com', '111122233', 'test', GETDATE(), 'Junior', 1, NULL, 1, 'TeamOverflow');

INSERT INTO dbo.UserInfo
	(userId, email, mobile, [password], dob, [role], IsEmployee, LoginTime, FreeOrBusy, TeamName)
VALUES
	(38, 'juniorsupport9@cc.com', '111122233', 'test', GETDATE(), 'Junior', 1, NULL, 1, 'TeamOverflow');

--INSERT INTO dbo.SupportAndCustomerMapping
--	(supportId,customerId)
--VALUES
--	(20, 11);

select * from dbo.UserInfo;

--select * from dbo.SupportAndCustomerMapping;


--SELECT CustomerList.Customer, UI2.email AS Agent
--FROM 
--	(SELECT		UI.email As Customer, SACM.supportId
--	FROM		[ChatApplicationDB].[dbo].[SupportAndCustomerMapping]	AS SACM
--	INNER JOIN	[ChatApplicationDB].[dbo].[UserInfo]					AS	UI
--	ON			UI.userId	= SACM.customerId) AS CustomerList
--INNER JOIN	[ChatApplicationDB].[dbo].[UserInfo] AS UI2
--ON			UI2.userId = CustomerList.supportId

GO

