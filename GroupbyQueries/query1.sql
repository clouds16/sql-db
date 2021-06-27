Select Player.FirstName, Player.LastName , Characters.CharacterName, Characters.AttackDamage
from Characters INNER JOIN Player where Characters.PlayerId = Player.PlayerID
GROUP BY PlayerID HAVING SUM(AttackDamage) >200