USE [rfid_atms_dm]
GO

/****** Object:  StoredProcedure [dbo].[SaveRecord]    Script Date: 10/18/2025 3:59:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

	ALTER PROCEDURE [dbo].[SaveRecord]
		@user_id VARCHAR(255),
		@first_name VARCHAR(100),
		@middle_name VARCHAR(100),
		@last_name VARCHAR(100)
		AS
	BEGIN
	SET NOCOUNT ON;
	INSERT INTO user_records(user_id, first_name, middle_name, last_name, date_created)
	VALUES(@user_id, @first_name, @middle_name, @last_name, GETDATE());

	EXEC GetAllRecords;
	END;

GO


