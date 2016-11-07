create procedure insertRegion (@RegionID int, @RegionDescription nchar(50))
as

	INSERT INTO [dbo].[Region]
			    ([RegionID]
                ,[RegionDescription])
		VALUES
			  (@RegionID
              ,@RegionDescription)
