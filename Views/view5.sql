create view [Cheap items] AS
select ItemPrice, Damage, ItemName 
from items where ItemPrice < 15000