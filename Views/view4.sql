Create view [High Attack Damage] AS
select CharacterName, AttackDamage,MaxHealth,Mana, Stamina
from Characters
where AttackDamge > 70