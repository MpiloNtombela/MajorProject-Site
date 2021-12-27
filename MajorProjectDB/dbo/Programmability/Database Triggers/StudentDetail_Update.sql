CREATE TRIGGER [StudentDetails_Update]
ON [dbo].[StudentDetail]
INSTEAD OF UPDATE
AS
BEGIN
	RETURN
END
