/**
 * Migration Description: 
 * 
 *
 * Rollback Instructions: 
 *
 *
 **/

BEGIN
	DECLARE	@SCRIPT_NAME varchar(256) = 'INSERT_SCRIPT_NAME_HERE';
	DECLARE @SCRIPT_COUNT integer = (select COUNT(*) from schema_migration WHERE filename=@SCRIPT_NAME);

	IF (@SCRIPT_COUNT > 0) PRINT N'SKIPPING MIGRATION';
	ELSE BEGIN
		PRINT N'RUNNING MIGRATION';
		/* START YOUR MIGRATION HERE */
		
		
		/* END YOUR MIGRATION HERE */
		PRINT N'FINISHED MIGRATION';
		INSERT INTO schema_migration(filename) VALUES(@SCRIPT_NAME);
	END;
END
GO