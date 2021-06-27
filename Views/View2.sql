create view [Emails starting with letter M] AS
select EmailAddress , FirstName, LastName 
From Player 
Where EmailAddress LIKE 'M'