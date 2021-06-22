CREATE PROCEDURE FindAccountBalance AS
select  AccountBalance , FirstName, LastName , EmailAddress
From Account a inner join Player p
on  a.AccountID  = p.AccountID
where a.AccountID > 0 
GO