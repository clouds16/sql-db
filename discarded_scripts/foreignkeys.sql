ALTER TABLE UserAccount 
ADD FOREIGN KEY (CharacterID) REFERENCES UserCharacter(CharacterID);

ALTER TABLE UserCharacter
ADD FOREIGN KEY (AbilityID) REFERENCES Abilities(AbilityID),
FOREIGN KEY (ItemID)  REFERENCES Items(ItemID) ;


ALTER TABLE Enemies
ADD FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
FOREIGN KEY (AbilityID) REFERENCES Abilities(AbilityID) ;

