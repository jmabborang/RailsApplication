IF OBJECT_ID('tblUsers') IS NULL
BEGIN
    CREATE TABLE [dbo].[tblUsers] (
        [Id] INT IDENTITY(1, 1) NOT NULL,
        [LoginName] VARCHAR(100) NOT NULL,
        [PasswordHash] VARCHAR(500) NULL,
        [EmployeeId] INT NULL,
        [LoginAttemptsCount] INT NOT NULL DEFAULT 0,
        [Date] DATETIME NOT NULL DEFAULT CAST(GETDATE() AS DATE), 
        [DateCreated] DATETIME DEFAULT GETDATE()
    )
END


GO

