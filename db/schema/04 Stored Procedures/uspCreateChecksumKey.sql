IF OBJECT_ID('uspCreateChecksumKeys') IS NOT NULL DROP PROCEDURE [uspCreateChecksumKeys]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE uspCreateChecksumKeys
AS
	DECLARE @Salt VARCHAR(200) = 'jgmproject'
	DECLARE @PrivateKey VARCHAR(100) = '2-444-66666-88888888'

	-- Generate the CheckSumValue
	SELECT [Name], [Description], CHECKSUM([Name] + @Salt)  
	FROM tblAccessKeys
	WHERE CheckSumValue IS NULL

	-- Make the Keys Active
	UPDATE tblAccessKeys
	SET IsActive = 1
	WHERE CheckSumValue IS NULL
GO