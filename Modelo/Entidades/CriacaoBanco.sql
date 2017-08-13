
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/13/2017 19:42:26
-- Created By: Willian Cevassi
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CadastroEmpresas];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Empresas'
CREATE TABLE [dbo].[Empresas] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Nome] varchar(100)  NOT NULL,
    [Endereco] varchar(max)  NULL,
    [Telefone] varchar(25)  NULL,
    [CNPJ] nchar(18)  UNIQUE NOT NULL,
    [CidadeID] int  NOT NULL
);
GO

-- Creating table 'Cidades'
CREATE TABLE [dbo].[Cidades] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(100) NOT NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
	[ID] int NOT NULL,
    [LimiteCredito] decimal(18,0)  NULL,
    [Vendedor] nvarchar(50)  NULL,
    [CreditoLiberado] bit  NULL    
);
GO

-- Creating table 'Fornecedores'
CREATE TABLE [dbo].[Fornecedores] (
	[ID] int  NOT NULL,
    [DataUltimaCompra] datetime  NULL,
    [Comprador] nvarchar(80)  NULL    
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Empresas'
ALTER TABLE [dbo].[Empresas]
ADD CONSTRAINT [PK_Empresas]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Cidades'
ALTER TABLE [dbo].[Cidades]
ADD CONSTRAINT [PK_Cidades]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PF_Clientes]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Fornecedores'
ALTER TABLE [dbo].[Fornecedores]
ADD CONSTRAINT [PK_Fornecedores]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CidadeID] in table 'Empresas'
ALTER TABLE [dbo].[Empresas]
ADD CONSTRAINT [FK_CidadeID]
    FOREIGN KEY ([CidadeID])
    REFERENCES [dbo].[Cidades]([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CidadeEmpresa'
CREATE INDEX [IX_FK_CidadeEmpresa]
ON [dbo].[Empresas]([CidadeID]);
GO

-- Creating foreign key on [ID] in table 'Empresas'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [FK_Cliente_Empresa]
    FOREIGN KEY ([ID])
	REFERENCES [dbo].[Empresas]([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID] in table 'Fornecedores'
ALTER TABLE [dbo].[Fornecedores]
ADD CONSTRAINT [FK_Fornecedor_Empresa]
    FOREIGN KEY ([ID])
    REFERENCES [dbo].[Empresas]([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------