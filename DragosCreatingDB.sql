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

CREATE TABLE [Menus](
	[MenuID] uniqueidentifier NOT NULL,
	[RestaurantID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_Menus] PRIMARY KEY ([MenuID]),
CONSTRAINT [FK_Menus_Restaurants] FOREIGN KEY ([RestaurantID])
	REFERENCES [Restaurants]([RestaurantID]));

CREATE TABLE [ProductCategory](
	[ProductCategoryID] uniqueidentifier NOT NULL,
	[Name] nvarchar(50) NOT NULL,
CONSTRAINT [PK_ProductCategory] PRIMARY KEY ([ProductCategoryID]));

CREATE TABLE [OrderTables](
	[OrderTableID] uniqueidentifier NOT NULL,
	[TotalPrice] int NOT NULL,
	[PaymentTypeID] uniqueidentifier NOT NULL,
	[TableID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_OrderTable] PRIMARY KEY ([OrderTableID]),
CONSTRAINT [FK_OrderTables_PaymentType] FOREIGN KEY ([PaymentTypeID])
	REFERENCES [PaymentTypes]([PaymentTypeID]),
CONSTRAINT [FK_OrderTables_Tables] FOREIGN KEY ([TableID])
	REFERENCES [Tables]([TableID]));

CREATE TABLE [Orders](
	[OrderID] uniqueidentifier NOT NULL,
	[Price] int NOT NULL,
	[OrderTableID] uniqueidentifier NOT NULL,
	[UserID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_Orders] PRIMARY KEY ([OrderID]),
CONSTRAINT [FK_Orders_OrderTable] FOREIGN KEY ([OrderTableID])
	REFERENCES [OrderTables]([OrderTableID]),
CONSTRAINT [FK_Orders_Users] FOREIGN KEY ([UserID])
	REFERENCES [Users]([UserID]));

CREATE TABLE [Waiters](
	[WaiterID] uniqueidentifier NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[RestaurantID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_Waiters] PRIMARY KEY ([WaiterID]),
CONSTRAINT [FK_Waiters_Restaurants] FOREIGN KEY ([RestaurantID])
	REFERENCES [Restaurants]([RestaurantID]));

CREATE TABLE [MenuProducts](
	[MenuProductID] uniqueidentifier NOT NULL,
	[Description] nvarchar(50),
	[Price] int NOT NULL,
	[MenuID] uniqueidentifier NOT NULL,
	[ProductCategoryID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_MenuProducts] PRIMARY KEY ([MenuProductID]),
CONSTRAINT [FK_MenuProducts_Menus] FOREIGN KEY ([MenuID])
	REFERENCES [Menus]([MenuID]),
CONSTRAINT [FK_MenuProducts_ProductCategory] FOREIGN KEY ([ProductCategoryID])
	REFERENCES [ProductCategory]([ProductCategoryID]));

CREATE TABLE [ProductOrderDetail](
	[ProductOrderDetailID] uniqueidentifier NOT NULL,
	[MenuProductID] uniqueidentifier NOT NULL,
	[OrderID] uniqueidentifier NOT NULL,
CONSTRAINT [PK_ProductOrderDetail] PRIMARY KEY ([ProductOrderDetailID]),
CONSTRAINT [FK_ProductOrderDetail_MenuProduct] FOREIGN KEY ([MenuProductID]) 
	REFERENCES [MenuProducts]([MenuProductID]),
CONSTRAINT [FK_ProductOrderDetail_Orders] FOREIGN KEY ([OrderID])
	REFERENCES [Orders]([OrderID]));







