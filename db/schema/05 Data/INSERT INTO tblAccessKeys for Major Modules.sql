DECLARE @SecurityKey TABLE (Id INT IDENTITY(1,1), SecurityKey VARCHAR(MAX), [Description] VARCHAR(MAX), ParentKey VARCHAR(MAX))

INSERT INTO @SecurityKey(SecurityKey, [Description], ParentKey)
SELECT SecurityKey, [Description], Parent
FROM (
	SELECT 'Dashboard' SecurityKey, 'Dashboard' [Description], '' Parent
	UNION
	SELECT 'Products', 'Products', ''
	UNION
	SELECT 'Inventory', 'Inventory', ''
	UNION
	SELECT 'Sales', 'Sales', ''
	UNION
	SELECT 'Reports', 'Reports', ''
	UNION
	SELECT 'Reports', 'Reports', ''
	UNION
	SELECT 'Maintenance', 'Maintenance', ''
	UNION
	SELECT 'Administration', 'Administration', ''
)tmp

DECLARE @Counter INT = 1
DECLARE @Total INT  
SELECT @Total = COUNT(*)
FROM @SecurityKey
WHILE @Counter <= @Total
BEGIN
	INSERT INTO tblAccessKeys([Name], [Description])
	SELECT sk.SecurityKey, sk.[Description]
	FROM @SecurityKey sk
	WHERE sk.Id = @Counter
	AND NOT EXISTS(SELECT Id FROM tblAccessKeys WHERE [Name] = sk.SecurityKey)
	
	INSERT INTO tblUserAccessKeys (UserId, AccessKeyId)
	SELECT u.Id, ak.Id
	FROM tblAccessKeys ak
	LEFT OUTER JOIN tblUsers u ON u.LoginName = 'admin'
	WHERE NOT EXISTS (
		SELECT u.Id
		FROM tblUsers u1
		INNER JOIN tblUserAccessKeys uak ON uak.UserId = u.Id
		WHERE uak.AccessKeyId = ak.Id
		AND u1.Id = u.Id
	)

	SET @Counter = @Counter + 1
END

UPDATE tblAccessKeys SET CheckSumValue = '1814440510' WHERE [Name] = 'Administration'	
UPDATE tblAccessKeys SET CheckSumValue = '1138738144' WHERE [Name] = 'Dashboard'	
UPDATE tblAccessKeys SET CheckSumValue = '1637756139' WHERE [Name] = 'Inventory'	
UPDATE tblAccessKeys SET CheckSumValue = '1619333353' WHERE [Name] = 'Maintenance'	
UPDATE tblAccessKeys SET CheckSumValue = '880669681' WHERE [Name] = 'Products'	
UPDATE tblAccessKeys SET CheckSumValue = '2117273903' WHERE [Name] = 'Reports'	
UPDATE tblAccessKeys SET CheckSumValue = '231479675' WHERE [Name] = 'Sales'	

GO
