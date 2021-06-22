DROP DATABASE IF EXISTS GameDB;
CREATE DATABASE GameDB



DROP TABLE IF EXISTS Region;
CREATE TABLE Region (
  RegionID int not null PRIMARY KEY IDENTITY, 
  RegionName varchar(255) not null, 
  

)


DROP TABLE IF EXISTS UserAccount;
CREATE TABLE UserAccount(
	AccountID      INT                NOT NULL          PRIMARY KEY IDENTITY,
  RegionID       int                NOT NULL  REFERENCES Region(RegionID), 
  CharacterID    int                NOT NULL, -- ForeignID
	UserName       varchar(255)       NOT NULL,
	FName          varchar(255)       NOT NULL,
	LName          varchar(255)       NOT NULL ,
	Email          varchar(255)       NOT NULL,
	UserPassword   varchar(255)       NOT NULL,
	CharacterLevel int not null )



DROP TABLE IF EXISTS Characters;
CREATE TABLE Characters (
	CharacterID     int               not null          PRIMARY KEY IDENTITY ,
  ItemID          INT               NOT NUll ,  -- Foreign ID   
  CharacterName   varchar(255)      NOT NULL, 
  AttackDamage    INT               NOT NULL,
  Health          int               NOT NULL,
  Mana            int               NOT NULL,
          )



DROP TABLE IF EXISTS Items ;
CREATE TABLE Items ( 
  ItemID         int                NOT NULL          PRIMARY KEY IDENTITY,
  AbilityID      int not null, --ForeignID
  ItemName       varchar(255)       NOT NULL,
  Damage         int                NOT NULL,
  ItemStrength  int                NOT NULL)



DROP TABLE IF EXISTS Abilities ;
CREATE TABLE Abilities ( 
  AbilityID int NOT NULL PRIMARY KEY IDENTITY ,
  AbilityName varchar(255) NOT NULL,
  Damage int NOT NULL,
  DamagePerLevel int NOT NULL)



Alter table UserAccount 
ADD FOREIGN KEY (CharacterID) REFERENCES UserCharacter(CharacterID)


Alter table UserCharacter 
ADD FOREIGN KEY (ItemID) REFERENCES Items(ItemID)

Alter table Items
ADD FOREIGN KEY (AbilityID) REFERENCES Abilities(AbilityID)



INSERT INTO Region 
Values 
(1,'North America') ,
(2, 'South Americ'),
(3, 'Europe'),
(4, 'Asia'),
(5, 'Australi'),
(6, 'Africa'),
(7, 'Middle East')


INSERT INTO UserAccount 
VALUES 
(1, 1, 1,'EazyBreezy', 'John', 'Smith', 'Jsmith@yahoo.com', 'Mypassword123', 12),
(2, 1, 1,'MajesticEmber', 'Mary', 'Sue', 'Msue@yahoo.com', 'Mypassword123',  25),
(3, 1, 3,'SonataAchan', 'Albert', 'Chan', 'Achan@yahoo.com', 'thebest', 2),
(4, 3, 4,'Vantage', 'Tim', 'Slater', 'Tslate@yahoo.com', 'hellothere1', 1),
(5, 4, 2,'Finding Tom', 'Tom', 'Wu', 'Twu@yahoo.com', 'iamthewinner', 100)



Insert into Characters
values
(1,2, 'Jax', 55, 1600, 200),
(2,4,'Riven', 60, 1400, 100),
(3,1 , 'Vlad', 30, 1700, 300),
(4,2, 'Vayne', 120, 1200, 80 ),
(5, 3, 'Miss Fortune', 110, 1250, 100)


Insert into Items
VALUES
(1, 1, 'Blade of The Ruined King', 200, 5000 ),
(2,1, 'Stridebreaker', 150, 8000),
(3,1, 'Rabadons DeathCap', 400, 4000),
(4,1, 'Linadries Embrace ', 300, 4500),
(5,1, 'Chains of Wrat', 100, 10000)


insert into Abilities 
values 
(1, 'Burn', 15 , 5 ),
(2, 'Freeze', 25 , 2),
(3 , 'Shock', 20 , 4)


select * from UserAccount
select* from UserCharacter


