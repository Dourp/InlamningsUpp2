create procedure UpdateRegion (@RegionID int, @RegionDescription nchar(50))
as

	update [dbo].[Region]
		set [RegionDescription] = @RegionDescription
		where [RegionID]=@RegionID
