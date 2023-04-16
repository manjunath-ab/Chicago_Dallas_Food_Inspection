CREATE TABLE `Dim_BusinessLicense`  (
  `BusinessLicensesSK` integer NOT NULL,
  `LicenseID` int NULL,
  `Account_Number` int NULL,
  `SiteNumber` int NULL,
  `LegalName` varchar(1000) NULL,
  `DBAName` varchar(1000) NULL,
  `Address` varchar(1000) NULL,
  `City` varchar(1000) NULL,
  `State` varchar(1000) NULL,
  `Zip_Code` int NULL,
  `Ward` int NULL,
  `Precinct` int NULL,
  `WardPrecinct` varchar(1000) NULL,
  `Police_District` int NULL,
  `License_Code` int NULL,
  `License_Description` varchar(1000) NULL,
  `Business_Activity` varchar(1000) NULL,
  `Business_Activity_ID` varchar(1000) NULL,
  `License_Number` int NULL,
  `Application_Type` varchar(255) NULL,
  `Application_Created_Date` date NULL,
  `Application_Requirements_Complete` date NULL,
  `Payment_Date` date NULL,
  `Conditional_Approval` varchar(255) NULL,
  `LicenseStatusTermStartDate` date NULL,
  `License_Term_Expiration_Date` date NULL,
  `License_Approvced_For_Issuance` date NULL,
  `Date_Issued` date NULL,
  `License_Status` varchar(1000) NULL,
  `License_Status_Change_Date` date NULL,
  `SSA` int NULL,
  `Latitude` float NULL,
  `Logitude` float NULL,
  `Location` varchar(1000) NULL,
  `CommunityAreas` integer NULL,
  `HistoricalWards2003-2015` integer NULL,
  `Zipcodes` integer NULL,
  `Census` integer NULL,
  `Wards` integer NULL,
  `DI_CreateDate` date NULL,
  `DI_WorkFlowFileName` varchar(255) NULL,
  `DI_WorkFlowDirectory` varchar(255) NULL,
  PRIMARY KEY (`BusinessLicensesSK`)
);

CREATE TABLE `Dim_FacilityType`  (
  `FacilitySK` integer NOT NULL,
  `FacilityType` varchar(255) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkflowDirectory` varchar(255) NULL,
  `DI_WorkflowFIleName` varchar(255) NULL,
  PRIMARY KEY (`FacilitySK`)
);

CREATE TABLE `Dim_FoodInspectionsResults`  (
  `ResultSK` integer NOT NULL,
  `Result` varchar(255) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkflowDirectory` varchar(255) NULL,
  `DI_WorkflowFIleName` varchar(255) NULL,
  PRIMARY KEY (`ResultSK`)
);

CREATE TABLE `Dim_Geo`  (
  `GeoSK` integer NOT NULL,
  `StreetAddress` varchar(255) NULL,
  `City` varchar(55) NULL,
  `State` varchar(55) NULL,
  `Zipcode` integer NULL,
  `Latitude` varchar(255) NULL,
  `Longitude` varchar(255) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkflowDirectory` varchar(255) NULL,
  `DI_WorkFlowFileName` varchar(255) NULL,
  PRIMARY KEY (`GeoSK`)
);

CREATE TABLE `Dim_InspectionType`  (
  `InspectionType_SK` integer NOT NULL,
  `InspectionType` varchar(10) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkflowDirectory` varchar(255) NULL,
  `DI_WorkflowFileName` varchar(255) NULL,
  PRIMARY KEY (`InspectionType_SK`)
);

CREATE TABLE `Dim_Restaurant`  (
  `RestaurantSK` integer NOT NULL,
  `RestaurantName` varchar(255) NULL,
  `StreetAddress` varchar(255) NULL,
  `Zipcode` integer NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkflowDirectory` varchar(255) NULL,
  `DI_WorkFlowFileName` varchar(255) NULL,
  PRIMARY KEY (`RestaurantSK`)
);

CREATE TABLE `Dim_RiskCategory`  (
  `RiskSK` integer NOT NULL,
  `Risk` varchar(255) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkflowDirectory` varchar(255) NULL,
  `DI_WorkflowFIleName` varchar(255) NULL,
  PRIMARY KEY (`RiskSK`)
);

CREATE TABLE `Dim_Violation`  (
  `ViolationSK` integer NOT NULL,
  `Violation_Code` varchar(255) NULL,
  `Violation_Description` varchar(1000) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkflowDirectory` varchar(255) NULL,
  `DI_WorkflowFileName` varchar(255) NULL,
  PRIMARY KEY (`ViolationSK`)
);

CREATE TABLE `Fact_Inspection`  (
  `InspectionSK` integer NOT NULL,
  `InspectionScore` integer NULL,
  `Inspection_Date` date NULL,
  `License_Number` integer NULL,
  `GeoSK` integer NULL,
  `RestaurantSK` integer NULL,
  `InspectionTypeSK` integer NULL,
  `FacilitySK` integer NULL,
  `ResultSK` integer NULL,
  `RiskSK` integer NULL,
  `BusinessLicensesSK` integer NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkflowDirectory` varchar(255) NULL,
  `DI_WorkflowFileName` varchar(255) NULL,
  PRIMARY KEY (`InspectionSK`)
);

CREATE TABLE `Fact_Violation`  (
  `FactViolationSK` integer NOT NULL,
  `ViolationSK` integer NULL,
  `InspectionSK` integer NULL,
  `Violation_Points` integer NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkflowDirectory` varchar(255) NULL,
  `DI_WorkflowFileName` varchar(255) NULL,
  PRIMARY KEY (`FactViolationSK`)
);

ALTER TABLE `Fact_Inspection` ADD CONSTRAINT `GeoSK` FOREIGN KEY (`GeoSK`) REFERENCES `Dim_Geo` (`GeoSK`);
ALTER TABLE `Fact_Inspection` ADD CONSTRAINT `RestaurantSK` FOREIGN KEY (`RestaurantSK`) REFERENCES `Dim_Restaurant` (`RestaurantSK`);
ALTER TABLE `Fact_Inspection` ADD CONSTRAINT `FacilitySK` FOREIGN KEY (`FacilitySK`) REFERENCES `Dim_FacilityType` (`FacilitySK`);
ALTER TABLE `Fact_Inspection` ADD CONSTRAINT `ResultSK` FOREIGN KEY (`ResultSK`) REFERENCES `Dim_FoodInspectionsResults` (`ResultSK`);
ALTER TABLE `Fact_Inspection` ADD CONSTRAINT `RiskSK` FOREIGN KEY (`RiskSK`) REFERENCES `Dim_RiskCategory` (`RiskSK`);
ALTER TABLE `Fact_Inspection` ADD CONSTRAINT `InspectionTypeSK` FOREIGN KEY (`InspectionTypeSK`) REFERENCES `Dim_InspectionType` (`InspectionType_SK`);
ALTER TABLE `Fact_Inspection` ADD CONSTRAINT `BusinessLicensesSK` FOREIGN KEY (`BusinessLicensesSK`) REFERENCES `Dim_BusinessLicense` (`BusinessLicensesSK`);
ALTER TABLE `Fact_Violation` ADD CONSTRAINT `ViolationSK` FOREIGN KEY (`ViolationSK`) REFERENCES `Dim_Violation` (`ViolationSK`);
ALTER TABLE `Fact_Violation` ADD CONSTRAINT `InspectionSK` FOREIGN KEY (`InspectionSK`) REFERENCES `Fact_Inspection` (`InspectionSK`);

