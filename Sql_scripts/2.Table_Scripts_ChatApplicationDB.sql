/*-----------------------------------------------------------------------------------------------
Description: DDL script for ChatApplicationDB
Author: Shubham Bhardwaj
Date: 29th July 2022
------------------------------------------------------------------------------------------------*/
USE ChatApplicationDB;

DROP TABLE IF EXISTS dbo.SupportAndCustomerMapping;
DROP TABLE IF EXISTS dbo.UserInfo;

-- This stable containes customer() and employee(agents) information in same table
-- NOTE: In real time we must maintain different tables

CREATE TABLE dbo.UserInfo
(
	userId			INT				PRIMARY KEY,
	email			VARCHAR(200)	NOT NULL,
	mobile			VARCHAR(200)	NOT NULL,
	[password]		VARCHAR(200)	NOT NULL,
	dob				DATE			NOT NULL,
	[role]			VARCHAR(100)	NOT NULL,
	IsEmployee		BIT				NOT NULL,
	LoginTime		DateTime		NULL,
	FreeOrBusy		BIT				NOT NULL,
	TeamName		VARCHAR(100)	NULL
)

-- This table contains agent and customer mapping using the Agent Chat Coordinator service

CREATE TABLE dbo.SupportAndCustomerMapping
(
	
	SACId		INT	IDENTITY(1,1) PRIMARY KEY,
	supportId	INT	NULL,
	customerId	INT	NULL,
	FOREIGN KEY(supportId) REFERENCES dbo.UserInfo(userId),
	FOREIGN KEY(customerId) REFERENCES dbo.UserInfo(userId)
)
