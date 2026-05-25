IF OBJECT_ID('tblAccessKeys') IS NULL
BEGIN
    CREATE TABLE [dbo].[tblAccessKeys] (
        [Id] INT IDENTITY(1, 1) NOT NULL,
        [Name] VARCHAR(500) NOT NULL,
        [Description] VARCHAR(500) NULL,
        [CheckSumValue] INT NULL,
        [IsActive] BIT NOT NULL DEFAULT 0
    )
END


GO







