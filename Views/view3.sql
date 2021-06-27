create view [Players in Californa] AS
select State , Line1, City, ZipCode 
from Addresses 
where State = 'CA'