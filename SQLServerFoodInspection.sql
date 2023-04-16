CREATE TABLE [Dim_BusinessLicense] (
  [BusinessLicensesSK] varchar(max) NOT NULL,
  [LicenseID] int NULL,
  [Account_Number] int NULL,
  [SiteNumber] int NULL,
  [LegalName] varchar(1000) NULL,
  [DBAName] varchar(1000) NULL,
  [Address] varchar(1000) NULL,
  [City] varchar(1000) NULL,
  [State] varchar(1000) NULL,
  [Zip_Code] varchar(255) NULL,
  [Ward] int NULL,
  [Precinct] int NULL,
  [WardPrecinct] varchar(1000) NULL,
  [Police_District] int NULL,
  [License_Code] int NULL,
  [License_Description] varchar(1000) NULL,
  [Business_Activity] varchar(1000) NULL,
  [Business_Activity_ID] varchar(1000) NULL,
  [License_Number] int NULL,
  [Application_Type] varchar(255) NULL,
  [Application_Created_Date] date NULL,
  [Application_Requirements_Complete] date NULL,
  [Payment_Date] date NULL,
  [Conditional_Approval] varchar(255) NULL,
  [LicenseStatusTermStartDate] date NULL,
  [License_Term_Expiration_Date] date NULL,
  [License_Approvced_For_Issuance] date NULL,
  [Date_Issued] date NULL,
  [License_Status] varchar(1000) NULL,
  [License_Status_Change_Date] date NULL,
  [SSA] int NULL,
  [Latitude] real NULL,
  [Logitude] real NULL,
  [Location] varchar(1000) NULL,
  [CommunityAreas] varchar(max) NULL,
  [HistoricalWards2003-2015] varchar(max) NULL,
  [Zipcodes] varchar(255) NULL,
  [Census] varchar(max) NULL,
  [Wards] varchar(max) NULL,
  [DI_CreateDate] date NULL,
  [DI_WorkFlowFileName] varchar(255) NULL,
  [DI_WorkFlowDirectory] varchar(255) NULL,
  CONSTRAINT [_copy_1] PRIMARY KEY CLUSTERED ([BusinessLicensesSK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Dim_FacilityType] (
  [FacilitySK] varchar(max) NOT NULL,
  [FacilityType] varchar(255) NULL,
  [DI_CreateDate] datetime2 NULL,
  [DI_WorkflowDirectory] varchar(255) NULL,
  [DI_WorkflowFIleName] varchar(255) NULL,
  CONSTRAINT [_copy_9] PRIMARY KEY CLUSTERED ([FacilitySK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Dim_FoodInspectionsResults] (
  [ResultSK] varchar(max) NOT NULL,
  [Result] varchar(255) NULL,
  [DI_CreateDate] datetime2 NULL,
  [DI_WorkflowDirectory] varchar(255) NULL,
  [DI_WorkflowFIleName] varchar(255) NULL,
  CONSTRAINT [_copy_8] PRIMARY KEY CLUSTERED ([ResultSK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Dim_Geo] (
  [GeoSK] varchar(max) NOT NULL,
  [StreetAddress] varchar(255) NULL,
  [City] varchar(55) NULL,
  [State] varchar(55) NULL,
  [Zipcode] varchar(255) NULL,
  [Latitude] varchar(255) NULL,
  [Longitude] varchar(255) NULL,
  [DI_CreateDate] datetime2 NULL,
  [DI_WorkflowDirectory] varchar(255) NULL,
  [DI_WorkFlowFileName] varchar(255) NULL,
  CONSTRAINT [_copy_2] PRIMARY KEY CLUSTERED ([GeoSK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Dim_InspectionType] (
  [InspectionType_SK] varchar(max) NOT NULL,
  [InspectionType] varchar(10) NULL,
  [DI_CreateDate] datetime2 NULL,
  [DI_WorkflowDirectory] varchar(255) NULL,
  [DI_WorkflowFileName] varchar(255) NULL,
  CONSTRAINT [_copy_6] PRIMARY KEY CLUSTERED ([InspectionType_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Dim_Restaurant] (
  [RestaurantSK] varchar(max) NOT NULL,
  [RestaurantName] varchar(255) NULL,
  [StreetAddress] varchar(255) NULL,
  [Zipcode] varchar(255) NULL,
  [DI_CreateDate] datetime2 NULL,
  [DI_WorkflowDirectory] varchar(255) NULL,
  [DI_WorkFlowFileName] varchar(255) NULL,
  CONSTRAINT [_copy_3] PRIMARY KEY CLUSTERED ([RestaurantSK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Dim_RiskCategory] (
  [RiskSK] varchar(max) NOT NULL,
  [Risk] varchar(255) NULL,
  [DI_CreateDate] datetime2 NULL,
  [DI_WorkflowDirectory] varchar(255) NULL,
  [DI_WorkflowFIleName] varchar(255) NULL,
  CONSTRAINT [_copy_7] PRIMARY KEY CLUSTERED ([RiskSK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Dim_Violation] (
  [ViolationSK] varchar(max) NOT NULL,
  [Violation_Code] varchar(255) NULL,
  [Violation_Description] varchar(1000) NULL,
  [DI_CreateDate] datetime2 NULL,
  [DI_WorkflowDirectory] varchar(255) NULL,
  [DI_WorkflowFileName] varchar(255) NULL,
  CONSTRAINT [_copy_5] PRIMARY KEY CLUSTERED ([ViolationSK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Fact_Inspection] (
  [InspectionSK] varchar(max) NOT NULL,
  [InspectionScore] varchar(max) NULL,
  [Inspection_Date] date NULL,
  [License_Number] varchar(max) NULL,
  [GeoSK] varchar(max) NULL,
  [RestaurantSK] varchar(max) NULL,
  [InspectionTypeSK] varchar(max) NULL,
  [FacilitySK] varchar(max) NULL,
  [ResultSK] varchar(max) NULL,
  [RiskSK] varchar(max) NULL,
  [BusinessLicensesSK] varchar(max) NULL,
  [DI_CreateDate] datetime2 NULL,
  [DI_WorkflowDirectory] varchar(255) NULL,
  [DI_WorkflowFileName] varchar(255) NULL,
  CONSTRAINT [_copy_4] PRIMARY KEY CLUSTERED ([InspectionSK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [Fact_Violation] (
  [FactViolationSK] varchar(max) NOT NULL,
  [ViolationSK] varchar(max) NULL,
  [InspectionSK] varchar(max) NULL,
  [Violation_Points] varchar(max) NULL,
  [DI_CreateDate] datetime2 NULL,
  [DI_WorkflowDirectory] varchar(255) NULL,
  [DI_WorkflowFileName] varchar(255) NULL,
  PRIMARY KEY CLUSTERED ([FactViolationSK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [GeoSK] FOREIGN KEY ([GeoSK]) REFERENCES [Dim_Geo] ([GeoSK])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [RestaurantSK] FOREIGN KEY ([RestaurantSK]) REFERENCES [Dim_Restaurant] ([RestaurantSK])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [FacilitySK] FOREIGN KEY ([FacilitySK]) REFERENCES [Dim_FacilityType] ([FacilitySK])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [ResultSK] FOREIGN KEY ([ResultSK]) REFERENCES [Dim_FoodInspectionsResults] ([ResultSK])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [RiskSK] FOREIGN KEY ([RiskSK]) REFERENCES [Dim_RiskCategory] ([RiskSK])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [InspectionTypeSK] FOREIGN KEY ([InspectionTypeSK]) REFERENCES [Dim_InspectionType] ([InspectionType_SK])
GO
ALTER TABLE [Fact_Inspection] ADD CONSTRAINT [BusinessLicensesSK] FOREIGN KEY ([BusinessLicensesSK]) REFERENCES [Dim_BusinessLicense] ([BusinessLicensesSK])
GO
ALTER TABLE [Fact_Violation] ADD CONSTRAINT [ViolationSK] FOREIGN KEY ([ViolationSK]) REFERENCES [Dim_Violation] ([ViolationSK])
GO
ALTER TABLE [Fact_Violation] ADD CONSTRAINT [InspectionSK] FOREIGN KEY ([InspectionSK]) REFERENCES [Fact_Inspection] ([InspectionSK])
GO

