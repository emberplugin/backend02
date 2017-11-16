



CREATE TABLE ComputerPart (

 primaryKey UUID NOT NULL,

 Broken BOOLEAN NULL,

 SerialNumber VARCHAR(255) NULL,

 CreateTime TIMESTAMP(3) NULL,

 Creator VARCHAR(255) NULL,

 EditTime TIMESTAMP(3) NULL,

 Editor VARCHAR(255) NULL,

 Type UUID NULL,

 Computer UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE Computer (

 primaryKey UUID NOT NULL,

 SerialNumber VARCHAR(255) NULL,

 ManufactureDate TIMESTAMP(3) NULL,

 Type VARCHAR(9) NULL,

 Description TEXT NULL,

 Description3 TEXT NULL,

 Description4 TEXT NULL,

 CreateTime TIMESTAMP(3) NULL,

 Creator VARCHAR(255) NULL,

 EditTime TIMESTAMP(3) NULL,

 Editor VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE Type (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NULL,

 CreateTime TIMESTAMP(3) NULL,

 Creator VARCHAR(255) NULL,

 EditTime TIMESTAMP(3) NULL,

 Editor VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMNETLOCKDATA (

 LockKey VARCHAR(300) NOT NULL,

 UserName VARCHAR(300) NOT NULL,

 LockDate TIMESTAMP(3) NULL,

 PRIMARY KEY (LockKey));


CREATE TABLE STORMSETTINGS (

 primaryKey UUID NOT NULL,

 Module VARCHAR(1000) NULL,

 Name VARCHAR(255) NULL,

 Value TEXT NULL,

 "User" VARCHAR(255) NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMAdvLimit (

 primaryKey UUID NOT NULL,

 "User" VARCHAR(255) NULL,

 Published BOOLEAN NULL,

 Module VARCHAR(255) NULL,

 Name VARCHAR(255) NULL,

 Value TEXT NULL,

 HotKeyData INT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMFILTERSETTING (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NOT NULL,

 DataObjectView VARCHAR(255) NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMWEBSEARCH (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NOT NULL,

 "Order" INT NOT NULL,

 PresentView VARCHAR(255) NOT NULL,

 DetailedView VARCHAR(255) NOT NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMFILTERDETAIL (

 primaryKey UUID NOT NULL,

 Caption VARCHAR(255) NOT NULL,

 DataObjectView VARCHAR(255) NOT NULL,

 ConnectMasterProp VARCHAR(255) NOT NULL,

 OwnerConnectProp VARCHAR(255) NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMFILTERLOOKUP (

 primaryKey UUID NOT NULL,

 DataObjectType VARCHAR(255) NOT NULL,

 Container VARCHAR(255) NULL,

 ContainerTag VARCHAR(255) NULL,

 FieldsToView VARCHAR(255) NULL,

 FilterSetting_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE UserSetting (

 primaryKey UUID NOT NULL,

 AppName VARCHAR(256) NULL,

 UserName VARCHAR(512) NULL,

 UserGuid UUID NULL,

 ModuleName VARCHAR(1024) NULL,

 ModuleGuid UUID NULL,

 SettName VARCHAR(256) NULL,

 SettGuid UUID NULL,

 SettLastAccessTime TIMESTAMP(3) NULL,

 StrVal VARCHAR(256) NULL,

 TxtVal TEXT NULL,

 IntVal INT NULL,

 BoolVal BOOLEAN NULL,

 GuidVal UUID NULL,

 DecimalVal DECIMAL(20,10) NULL,

 DateTimeVal TIMESTAMP(3) NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE ApplicationLog (

 primaryKey UUID NOT NULL,

 Category VARCHAR(64) NULL,

 EventId INT NULL,

 Priority INT NULL,

 Severity VARCHAR(32) NULL,

 Title VARCHAR(256) NULL,

 Timestamp TIMESTAMP(3) NULL,

 MachineName VARCHAR(32) NULL,

 AppDomainName VARCHAR(512) NULL,

 ProcessId VARCHAR(256) NULL,

 ProcessName VARCHAR(512) NULL,

 ThreadName VARCHAR(512) NULL,

 Win32ThreadId VARCHAR(128) NULL,

 Message VARCHAR(2500) NULL,

 FormattedMessage TEXT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMAuObjType (

 primaryKey UUID NOT NULL,

 Name VARCHAR(255) NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMAuEntity (

 primaryKey UUID NOT NULL,

 ObjectPrimaryKey VARCHAR(38) NOT NULL,

 OperationTime TIMESTAMP(3) NOT NULL,

 OperationType VARCHAR(100) NOT NULL,

 ExecutionResult VARCHAR(12) NOT NULL,

 Source VARCHAR(255) NOT NULL,

 SerializedField TEXT NULL,

 User_m0 UUID NOT NULL,

 ObjectType_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));


CREATE TABLE STORMAuField (

 primaryKey UUID NOT NULL,

 Field VARCHAR(100) NOT NULL,

 OldValue TEXT NULL,

 NewValue TEXT NULL,

 MainChange_m0 UUID NULL,

 AuditEntity_m0 UUID NOT NULL,

 PRIMARY KEY (primaryKey));




 ALTER TABLE ComputerPart ADD CONSTRAINT FKcd9f080132d74d749ee49cfe5febb0ea FOREIGN KEY (Type) REFERENCES Type; 
CREATE INDEX Indexe7f60964d0354bce842030deb3b5de7a on ComputerPart (Type); 

 ALTER TABLE ComputerPart ADD CONSTRAINT FK174887815de94912b68a807ea7fd33c4 FOREIGN KEY (Computer) REFERENCES Computer; 
CREATE INDEX Index37157314507e40d48b9552eec55db889 on ComputerPart (Computer); 

 ALTER TABLE STORMWEBSEARCH ADD CONSTRAINT FK078fd7cb577d4eefaf6799ce50a07245 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERDETAIL ADD CONSTRAINT FK03a0a16cf1dc44328f515cac82f18b6f FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERLOOKUP ADD CONSTRAINT FK00c03b6e502b429eb1e369ef6b0d65fd FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMAuEntity ADD CONSTRAINT FK5bee2aa109ec404890c5865214b7d91d FOREIGN KEY (ObjectType_m0) REFERENCES STORMAuObjType; 

 ALTER TABLE STORMAuField ADD CONSTRAINT FK4cc1a8d6732f4b8ebfcb2800f03cb5bd FOREIGN KEY (MainChange_m0) REFERENCES STORMAuField; 

 ALTER TABLE STORMAuField ADD CONSTRAINT FK57e0cfdbdcfe4b5183e60453375107a6 FOREIGN KEY (AuditEntity_m0) REFERENCES STORMAuEntity; 

