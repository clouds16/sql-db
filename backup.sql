
USE master;
GO

IF  DB_ID('GameServer') IS NOT NULL
DROP DATABASE GameServer;
GO

CREATE DATABASE GameServer;
GO

USE GameServer;

-- create the tables for the database
CREATE TABLE Region (
  RegionID        INT            PRIMARY KEY   IDENTITY,
  RegionName      VARCHAR(255)   NOT NULL    
);

CREATE TABLE Account (
  AccountID         INT            PRIMARY KEY   IDENTITY,
  RegionID        INT            REFERENCES Region (RegionID), 
  AccountBalance      money   NOT NULL     ,
  CreditCardNo int default null,
  GamesOwned int not NULL ,
  DateAdded         DATETIME                     DEFAULT NULL
);

CREATE TABLE Player (
  PlayerID           INT            PRIMARY KEY   IDENTITY,
  EmailAddress         VARCHAR(255)   NOT NULL      UNIQUE,
  Password             VARCHAR(60)    NOT NULL,
  FirstName            VARCHAR(60)    NOT NULL,
  LastName             VARCHAR(60)    NOT NULL,

);

CREATE TABLE Addresses (
  AddressID          INT            PRIMARY KEY   IDENTITY,
  PlayerID         INT            REFERENCES Player (PlayerID),
  Line1              VARCHAR(60)    NOT NULL,
  City               VARCHAR(40)    NOT NULL,
  State              VARCHAR(2)     NOT NULL,
  ZipCode            VARCHAR(10)    NOT NULL,
  Phone              VARCHAR(12)    NOT NULL,

);

CREATE TABLE Characters (
  CharacterID           INT            PRIMARY KEY  IDENTITY,
  PlayerID        INT            REFERENCES Player (PlayerID),
  CharacterName         varchar(255)       NOT NULL,
  AttackDamage int not null,
  MaxHealth int not null, 
  Mana int not null, 
  Stamina int not null,
);

CREATE TABLE Items (
  ItemID             INT            PRIMARY KEY  IDENTITY,
  CharacterID            INT            REFERENCES Characters (CharacterID),
  AccountID          INT            REFERENCES Account (AccountID),
  ItemPrice          MONEY  NOT NULL,
  Damage     INT  NOT NULL,
  ItemName varchar(255) not null
 
);

CREATE TABLE Administrators (
  AdminID           INT            PRIMARY KEY   IDENTITY,
  EmailAddress      VARCHAR(255)   NOT NULL,
  Password          VARCHAR(255)   NOT NULL,
  FirstName         VARCHAR(255)   NOT NULL,
  LastName          VARCHAR(255)   NOT NULL
);

-- Insert data into the tables

SET IDENTITY_INSERT Region ON;

INSERT INTO Region (RegionID, RegionName) VALUES
(1, 'North America'),
(2, 'South America'),
(3, 'Europe'), 
(4, 'Asia'), 
(5, 'Australia'),
(6, 'Africa')

SET IDENTITY_INSERT Region OFF;



SET IDENTITY_INSERT Account ON;

INSERT INTO Account (AccountID, RegionID, AccountBalance, CreditCardNo, GamesOwned, DateAdded) VALUES
(1, 1, 238.12 , NULL, 1, '1/21/20'),
(2, 3, 5.12 , NULL,2, '1/22/20'),
(3, 3,  0, NULL,2, '1/23/20'), 
(4, 4 , 100, Null,3, '1/24/20'), 
(5, 1 , 50 , NULL,1, '1/25/20'),
(6,  5 , 0 , NULL,2, '1/26/20')

SET IDENTITY_INSERT Account OFF;




SET IDENTITY_INSERT Player ON;

INSERT INTO Player(PlayerID, EmailAddress, Password, FirstName , LastName) VALUES 
(1 , 'halv@gmail.com'  , 'thisismypassword'   , 'Hector'    , 'Alvarez'  ),
(2 , 'melibeli@gmail.com'  , 'melibelibeli'   , 'Meli'    , 'Rahim'  ),
(3, 'ray@gmail.com'  , 'raythecoolguy'   , 'Ray'    , 'Lau'  ),
(4 , 'alber@gmail.com'  , 'Asonatachan'   , 'Alb'    , 'Chan'  ),
(5 , 'steph@gmail.com'  , 'hithisissteph'   , 'Steph'    , 'Vista'  ),
(6 , 'tom@gmail.com'  , 'yesthisistom'   , 'Tom'    , 'Kim'  );

SET IDENTITY_INSERT Player OFF;


----------------------------Address


SET IDENTITY_INSERT Addresses ON;

INSERT INTO Addresses(AddressID , PlayerID, Line1, City, State, ZipCode, Phone) VALUES 
(1 , 1 , '530 e boone' , 'Santa Barbara' , 'CA ', '98763', '8058228345' ),
(2 , 2 , '678 La Regencia' , 'San Diego' , 'CA ', '92363', '8058223221' ),
(3 , 3 , '876 E Walkway' , 'Santa Barbara' , 'MS ', '98763', '8058228345' ),
(4 , 4 , '236 New Malone' , 'Santa Barbara' , 'HW ', '98763', '8058228345' ),
(5 , 5 , '986 Beach Dr' , 'Santa Barbara' , 'OR ', '98763', '8058228345' ),
(6 , 6 , '123 Rocky Road' , 'Istanbul' , 'NV ', '12363', '345678845' )

SET IDENTITY_INSERT Addresses OFF;



--- -----------------------------Characters



SET IDENTITY_INSERT  Characters ON;

INSERT INTO Characters(CharacterId, PlayerID , CharacterName, AttackDamage, MaxHealth, Mana, Stamina) VALUES 
(1 , 1 , 'Riven', 87, 1600, 200, 300  ),
(2 , 2 , 'Yassuo', 107, 1300, 400, 70  ),
(3 , 3 , 'Fizz', 80, 1350, 100, 300  ),
(4 , 4 , 'Hiemerdongle', 55, 1100, 200, 300  ),
(5 , 5 , 'Annie', 66, 1100, 200, 250  ),
(6 , 6 , 'Tahm kench', 0, 8000, 150, 20  )


SET IDENTITY_INSERT Characters OFF;



----------------------------------------------------------------------------------------------------------------



SET IDENTITY_INSERT  Items ON;

INSERT INTO Items(ItemID, CharacterID, AccountID, ItemPrice, Damage, ItemName) VALUES 
(1 , 1 , 1, 1200.0, 100, 'Stridebreaker'),
(2 , 1 , 1, 3200.0, 300 , 'Last Whisper'),
(3 , 2 , 3, 500.0, 150 , 'Forge of iron'),
(4 , 4 , 4, 1600.0, 120 , 'Shadow Of The Mist'),
(5 , 3 , 5, 5000.0, 100 , 'Stand Eternal')

SET IDENTITY_INSERT Items OFF;


----------------------------------------------------------------------------------------------------------------



select * from Account
select * from Region
select * from Characters
select * from Items
select * from Player
select * from Addresses


