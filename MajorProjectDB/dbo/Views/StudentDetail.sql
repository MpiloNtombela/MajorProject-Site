CREATE VIEW [dbo].[StudentDetail]
	AS SELECT StudentID, U.Id, U.FirstName, U.LastName, U.Email, U.PhoneNumber, U.PhoneNumberConfirmed, U.EmailConfirmed,
	S.DateOfBirth, S.HomeAddress, S.Gender , S.Active, S.IDNumber,
	UR.RoleId
	FROM AspNetUsers U, Student S, AspNetUserRoles UR
	WHERE U.Id = S.UserID AND LOWER(UR.RoleId) = 'student' AND UR.UserId = U.Id