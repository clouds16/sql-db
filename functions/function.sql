create function LevelCap(
    @level int 

) returns int

begin 
    declare @retur_val int ;
    if (@level > 100 ) set @return_val = 100;
    return @return_val
end;