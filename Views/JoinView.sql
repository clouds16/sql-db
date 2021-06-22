Select Player.FirstName, Player.LastName, Player.EmailAddress, Addresses.City , Addresses.State-- Get a list of tables and views in the current database
from Addresses
INNER JOIN Player on Addresses.PlayerID = Player.PlayerID