
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/20/2019 17:39:18
-- Generated from EDMX file: C:\Users\agup0013\source\repos\Travel and Tourism\Travel and Tourism\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TravelDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TravellerPackages]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Packages] DROP CONSTRAINT [FK_TravellerPackages];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Travellers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Travellers];
GO
IF OBJECT_ID(N'[dbo].[Packages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Packages];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Travellers'
CREATE TABLE [dbo].[Travellers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [StudentId] nvarchar(max)  NOT NULL,
    [Food] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Packages'
CREATE TABLE [dbo].[Packages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Deals] nvarchar(max)  NOT NULL,
    [Places] nvarchar(max)  NOT NULL,
    [TravellerId] int  NOT NULL,
    [DealCode] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Travellers'
ALTER TABLE [dbo].[Travellers]
ADD CONSTRAINT [PK_Travellers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Packages'
ALTER TABLE [dbo].[Packages]
ADD CONSTRAINT [PK_Packages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TravellerId] in table 'Packages'
ALTER TABLE [dbo].[Packages]
ADD CONSTRAINT [FK_TravellerPackages]
    FOREIGN KEY ([TravellerId])
    REFERENCES [dbo].[Travellers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TravellerPackages'
CREATE INDEX [IX_FK_TravellerPackages]
ON [dbo].[Packages]
    ([TravellerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------