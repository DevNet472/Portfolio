USE db_ElectricWholesale002

--TEMPORAL TABLE REQUIRED TO HOLD FORECAST DATA--
CREATE TABLE dbo.Forecast 
(
		ForecastID INT NOT NULL IDENTITY (301,1) PRIMARY KEY,
		CustomerID INT NOT NULL 
		CONSTRAINT FK_Sale_Customer FOREIGN KEY REFERENCES dbo.Customer(CustomerID),
		ProductID int NOT NULL
		CONSTRAINT FK_type_product FOREIGN KEY REFERENCES dbo.Product(ProductID),
		Quantity smallint NOT NULL
		CHECK (Quantity BETWEEN 1 AND 999),
		Amount decimal(10,2) NOT NULL
		CHECK (Amount > 0.00),
		SysStart datetime2 (0) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
		SysEnd datetime2 (0) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
		PERIOD FOR SYSTEM_TIME (SysStart, SysEnd)

		)
		WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.ForecastHistory));
		
CREATE TABLE dbo.Customer 
(
		CustomerID INT NOT NULL IDENTITY (401,1) PRIMARY KEY,
		CustomerName varchar(50) NOT NULL,
		City varchar(50) NOT NULL,
		CreditLimit INT NOT NULL,
		SysStart datetime2 (0) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
		SysEnd datetime2 (0) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
		PERIOD FOR SYSTEM_TIME (SysStart, SysEnd)

		)
		WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.CustomerHistory2));
		
		CREATE TABLE dbo.Color 
(
		ColorID INT NOT NULL IDENTITY (601,1) PRIMARY KEY,
		ColorName varchar(50) NOT NULL,
	);
	
		CREATE TABLE dbo.Product 
(
		ProductID INT NOT NULL IDENTITY (301,1) PRIMARY KEY,
		ProductName varchar(50) NOT NULL,
		CONSTRAINT FK_type_Product FOREIGN KEY REFERENCES dbo.Color(ColorID),
		LengthMetres int NOT NULL,
		SysStart datetime2 (0) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
		SysEnd datetime2 (0) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
		PERIOD FOR SYSTEM_TIME (SysStart, SysEnd)

		)
		WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.ProductHistory));


		--Creates View Before more forecasts were added--

		