USE [rfid_atms_dm]
GO

/****** Object:  StoredProcedure [dbo].[UpdateRecord]    Script Date: 10/18/2025 4:33:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

	ALTER PROCEDURE [dbo].[UpdateRecord]
		@id INT, 
		@user_id VARCHAR(100),
		@first_name VARCHAR(100),
		@middle_name VARCHAR(100),
		@last_name VARCHAR(100)
	AS
	BEGIN 
		UPDATE user_records 
			SET 
			user_id = @user_id,
			first_name = @first_name,
			middle_name = @middle_name,
			last_name = @last_name
		WHERE id = @id;
		EXEC GetAllRecords;
	END;
GO


