-- CREATE DATABASE rfid_atms_dm for creation of new database
--USE rfid_atms_dm

--CREATE TABLE user_records(
--	id INT IDENTITY(1,1) PRIMARY KEY,
--	user_id VARCHAR(255), 
--	first_name VARCHAR(100),
--	middle_name VARCHAR(100),
--	last_name VARCHAR(100),
--	date_created DATETIME DEFAULT GETDATE()
--)

--USE rfid_atms_dm
--SELECT * FROM sys.tables

--USE rfid_atms_dm
--GO
--	CREATE PROCEDURE SaveRecord
--		@user_id VARCHAR(255),
--		@first_name VARCHAR(100),
--		@middle_name VARCHAR(100),
--		@last_name VARCHAR(100)
--		AS
--	BEGIN
--	SET NOCOUNT ON;
--	INSERT INTO user_records(user_id, first_name, middle_name, last_name, date_created)
--	VALUES(@user_id, @first_name, @middle_name, @last_name, GETDATE());
--	END;

--GO

--USE rfid_atms_dm
--EXEC SaveRecord '0001', 'Clarisa', 'Tavares', 'Garcia'

--USE rfid_atms_dm
--GO
--CREATE PROCEDURE GetAllRecords
--AS 
--	BEGIN
--	SELECT * FROM user_records
--	END;
--GO

--USE rfid_atms_dm
--EXEC GetAllRecords

--USE rfid_atms_dm
--EXEC SaveRecord '0002', 'Hanna', 'Lucena', 'Constantino'

--USE rfid_atms_dm
--GO
--CREATE PROCEDURE RemoveRecords
--	@id INT
--AS 
--	BEGIN
--	DELETE FROM user_records WHERE id = @id;
--	EXEC GetAllRecords;
--	END;
--GO

--EXEC RemoveRecords 2

USE rfid_atms_dm
GO
	CREATE PROCEDURE UpdateRecord
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
	END;
GO 

--USE rfid_atms_dm
--EXEC GetAllRecords
--EXEC UpdateRecord 1, '0002', 'Lazy', 'Lucena', 'Constantino'

USE rfid_atms_dm
EXEC UpdateRecord 1, '0002', '', 'Lucena', 'Constantino'

EXEC Get