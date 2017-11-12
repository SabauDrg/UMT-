--CREATE DATABASE EasyOrder
USE [EasyOrder]
GO

CREATE TABLE [Users](
	[UserID] uniqueidentifier NOT NULL,
	[E-mail] nvarchar(50) NOT NULL,
CONSTRAINT [PK_Users] PRIMARY KEY ([UserID]));

CREATE TABLE [Adresses](
	[AdressID] uniqueidentifier NOT NULL,
	[Street] nvarchar(50) NOT NULL,
	[City] nvarchar(50) NOT NULL,
CONSTRAINT [PK_Adresses] PRIMARY KEY ([AdressID]));

CREATE TABLE [Restaurants](
	[RestaurantID] uniqueidentifier NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[AdressID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_Restaurants] PRIMARY KEY ([RestaurantID]),
CONSTRAINT [FK_Restaurants_Adress] FOREIGN KEY ([AdressID])
	REFERENCES [Adresses]([AdressID]));

CREATE TABLE [PaymentTypes](
	[PaymentTypeID] uniqueidentifier NOT NULL,
	[Name] nvarchar(50) NOT NULL,
CONSTRAINT [PK_PaymentTypes] PRIMARY KEY ([PaymentTypeID]));

CREATE TABLE [Tables](
	[TableID] uniqueidentifier NOT NULL,
	[Number] nvarchar(50) NOT NULL,
	[RestaurantID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_Tables] PRIMARY KEY ([TableID]),
CONSTRAINT [FK_Tables_Restaurants] FOREIGN KEY ([RestaurantID])
	REFERENCES [Restaurants]([RestaurantID]));

