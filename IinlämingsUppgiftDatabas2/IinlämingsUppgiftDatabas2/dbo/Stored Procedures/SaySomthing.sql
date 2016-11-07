create procedure SaySomthing(@message nvarchar(50), @counter int)
as

	while (@counter > 0)
	begin
		print @message + ' ' + cast(@counter as nvarchar(2))
		set @counter = @counter - 1
	end

exec SaySomthing 'Hello World', 5