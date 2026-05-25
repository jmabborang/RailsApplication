IF OBJECT_ID('tblUserAccessKeys') IS NULL
BEGIN
    CREATE TABLE [dbo].[tblUserAccessKeys]
    (
        [UserId] INT NOT NULL,
        [AccessKeyId] INT NOT NULL,
    )
END


GO