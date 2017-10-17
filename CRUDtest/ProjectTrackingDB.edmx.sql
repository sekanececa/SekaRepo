
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/25/2017 16:41:08
-- Generated from EDMX file: C:\Users\Sandra\Documents\Projects\CRUDtest\CRUDtest\ProjectTrackingDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CRUDtest];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__ManagerCo__Proje__1B0907CE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ManagerComments] DROP CONSTRAINT [FK__ManagerCo__Proje__1B0907CE];
GO
IF OBJECT_ID(N'[dbo].[FK__ProjectTa__Assig__173876EA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProjectTasks] DROP CONSTRAINT [FK__ProjectTa__Assig__173876EA];
GO
IF OBJECT_ID(N'[dbo].[FK__ProjectTa__UserS__182C9B23]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProjectTasks] DROP CONSTRAINT [FK__ProjectTa__UserS__182C9B23];
GO
IF OBJECT_ID(N'[dbo].[FK__UserStori__Proje__145C0A3F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserStories] DROP CONSTRAINT [FK__UserStori__Proje__145C0A3F];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[ManagerComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ManagerComments];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[ProjectTasks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProjectTasks];
GO
IF OBJECT_ID(N'[dbo].[UserStories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserStories];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [EmployeeID] int  NOT NULL,
    [EmployeeName] nvarchar(100)  NULL,
    [Designation] nvarchar(100)  NULL,
    [ManagerID] int  NULL,
    [ContactNo] nvarchar(15)  NULL,
    [EMailID] nvarchar(30)  NULL,
    [SkillSets] nvarchar(100)  NULL
);
GO

-- Creating table 'ManagerComments'
CREATE TABLE [dbo].[ManagerComments] (
    [ManagerCommentID] int IDENTITY(1,1) NOT NULL,
    [Comments] nvarchar(2000)  NULL,
    [ProjectTaskID] int  NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [ProjectID] int IDENTITY(1,1) NOT NULL,
    [ProjectName] nvarchar(100)  NULL,
    [StartDate] datetime  NULL,
    [EndDate] datetime  NULL,
    [ClientName] nvarchar(100)  NULL
);
GO

-- Creating table 'ProjectTasks'
CREATE TABLE [dbo].[ProjectTasks] (
    [ProjectTaskID] int IDENTITY(1,1) NOT NULL,
    [AssignedTo] int  NULL,
    [TaskStartDate] datetime  NULL,
    [TaskEndDate] datetime  NULL,
    [TaskCompletion] int  NULL,
    [UserStoryID] int  NULL
);
GO

-- Creating table 'UserStories'
CREATE TABLE [dbo].[UserStories] (
    [UserStoryID] int IDENTITY(1,1) NOT NULL,
    [Story] nvarchar(4000)  NULL,
    [ProjectID] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [EmployeeID] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC);
GO

-- Creating primary key on [ManagerCommentID] in table 'ManagerComments'
ALTER TABLE [dbo].[ManagerComments]
ADD CONSTRAINT [PK_ManagerComments]
    PRIMARY KEY CLUSTERED ([ManagerCommentID] ASC);
GO

-- Creating primary key on [ProjectID] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([ProjectID] ASC);
GO

-- Creating primary key on [ProjectTaskID] in table 'ProjectTasks'
ALTER TABLE [dbo].[ProjectTasks]
ADD CONSTRAINT [PK_ProjectTasks]
    PRIMARY KEY CLUSTERED ([ProjectTaskID] ASC);
GO

-- Creating primary key on [UserStoryID] in table 'UserStories'
ALTER TABLE [dbo].[UserStories]
ADD CONSTRAINT [PK_UserStories]
    PRIMARY KEY CLUSTERED ([UserStoryID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AssignedTo] in table 'ProjectTasks'
ALTER TABLE [dbo].[ProjectTasks]
ADD CONSTRAINT [FK__ProjectTa__Assig__173876EA]
    FOREIGN KEY ([AssignedTo])
    REFERENCES [dbo].[Employees]
        ([EmployeeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ProjectTa__Assig__173876EA'
CREATE INDEX [IX_FK__ProjectTa__Assig__173876EA]
ON [dbo].[ProjectTasks]
    ([AssignedTo]);
GO

-- Creating foreign key on [ProjectTaskID] in table 'ManagerComments'
ALTER TABLE [dbo].[ManagerComments]
ADD CONSTRAINT [FK__ManagerCo__Proje__1B0907CE]
    FOREIGN KEY ([ProjectTaskID])
    REFERENCES [dbo].[ProjectTasks]
        ([ProjectTaskID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ManagerCo__Proje__1B0907CE'
CREATE INDEX [IX_FK__ManagerCo__Proje__1B0907CE]
ON [dbo].[ManagerComments]
    ([ProjectTaskID]);
GO

-- Creating foreign key on [ProjectID] in table 'UserStories'
ALTER TABLE [dbo].[UserStories]
ADD CONSTRAINT [FK__UserStori__Proje__145C0A3F]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[Projects]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__UserStori__Proje__145C0A3F'
CREATE INDEX [IX_FK__UserStori__Proje__145C0A3F]
ON [dbo].[UserStories]
    ([ProjectID]);
GO

-- Creating foreign key on [UserStoryID] in table 'ProjectTasks'
ALTER TABLE [dbo].[ProjectTasks]
ADD CONSTRAINT [FK__ProjectTa__UserS__182C9B23]
    FOREIGN KEY ([UserStoryID])
    REFERENCES [dbo].[UserStories]
        ([UserStoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__ProjectTa__UserS__182C9B23'
CREATE INDEX [IX_FK__ProjectTa__UserS__182C9B23]
ON [dbo].[ProjectTasks]
    ([UserStoryID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------