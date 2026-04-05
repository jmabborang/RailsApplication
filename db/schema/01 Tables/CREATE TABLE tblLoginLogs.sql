IF OBJECT_ID('tblLoginLogs') IS NULL
BEGIN
    CREATE TABLE [dbo].[tblLoginLogs]
    (
        [Id] INT IDENTITY(1, 1) NOT NULL,
        [Username] VARCHAR(500) NOT NULL,
        [DeviceName] VARCHAR(500) NULL,
        [Status] VARCHAR(200) NOT NULL,
        [IPAddress] VARCHAR(500) NULL,
        [Date] DATETIME NOT NULL DEFAULT CAST(GETDATE() AS DATE), 
        [RequestTime] DATETIME NOT NULL DEFAULT GETDATE()
    )
END


GO