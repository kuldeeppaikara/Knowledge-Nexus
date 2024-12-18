use LibrarySystem;

alter procedure sp_IsUserExist
(
@UserId [nvarchar](50),
@EmailId [nvarchar](50)
)
as
begin
set nocount on;
select * from dbo.UserMaster where UserId=@UserId and EmailId = @EmailId
end 
go

alter procedure sp_SignUpRecord
(
@FullName [nvarchar](50),
@Userid[nvarchar](50),
@UserPassword [nvarchar](50),
@DateOfBirth [nvarchar](50),
@ContactNo [nvarchar](50),
@EmailId [nvarchar](50),
@State [nvarchar](50),
@City [nvarchar](50),
@pinCode [nvarchar](50),
@FullAddress [nvarchar](max),
@AccountStatus [nvarchar](50)
)
as 
begin
insert into dbo.UserMaster(FullName,Userid,UserPassword,DateOfBirth,ContactNo,EmailId,State,City,pinCode,FullAddress,AccountStatus)
values(@FullName,@Userid,@UserPassword,@DateOfBirth,@ContactNo,@EmailId,@State,@City,@pinCode,@FullAddress,@AccountStatus)
end 
go


create procedure sp_AuthorInfo
(
@author_id [nchar](10),
@author_name [nvarchar](50)
)
as 
begin
insert into dbo.AuthorMaster(author_id,author_name) values(@author_id,@author_name)
end
go

create procedure sp_getAuthor
as 
begin
select author_id,author_name from AuthorMaster
end 
go

alter procedure getAuthorById
(@id nchar(10))
as 
begin
select author_id,author_name from AuthorMaster where author_id=@id;
end 
go

create procedure spGetAuthorById
(
@id nchar(10)
)
as
begin
set nocount on;
select author_id,author_name from author_master_tbl where author_id=@id
end
go

alter procedure sp_UpdateAuthor
(
@author_id nchar(10),
@author_name nvarchar(50)
)
as 
begin
update dbo.AuthorMaster set author_name =@author_name where author_id=@author_id;
end
go

create procedure sp_InsertPublisher
(
@publisher_id nchar(10),
@publisher_name nvarchar(max)
)
as 
begin
insert into dbo.PublisherMaster (publisher_id,publisher_name) values(@publisher_id,@publisher_name)
end 
go

create procedure sp_UpdatePublisher
(
@publisher_id nchar(10),
@publisher_name nvarchar(max)
)
as 
begin
update dbo.PublisherMaster set publisher_name =@publisher_name where publisher_id=@publisher_id;
end
go

alter procedure sp_getPublisherById
(@publisher_id nchar(10))
as 
begin
select publisher_id,publisher_name from PublisherMaster where publisher_id=@publisher_id
end 
go

alter procedure sp_getPublisher
as 
begin
select publisher_id,publisher_name from dbo.PublisherMaster;
end 
go

alter procedure sp_AllMember
as
begin
SELECT FullName, UserId, AccountStatus FROM dbo.UserMaster 
ORDER BY CASE WHEN AccountStatus = 'Active' THEN 0 
WHEN AccountStatus = 'Pending' THEN 1 ELSE 2 END;
end
go

create procedure sp_ActiveMember
as
begin
SELECT FullName, UserId, AccountStatus FROM dbo.UserMaster WHERE AccountStatus = 'Active';
end
go

create procedure sp_PendingMember
as
begin
SELECT FullName, UserId, AccountStatus FROM dbo.UserMaster WHERE AccountStatus = 'Pending';
end
go

create procedure sp_DeactiveMember
as
begin
SELECT FullName, UserId, AccountStatus FROM dbo.UserMaster WHERE AccountStatus = 'Deactive';
end
go

alter procedure sp_MemberIdDetail
(
@UserId nvarchar(50)
)
as 
begin
SELECT UserId,FullName, EmailId, DateOfBirth, ContactNo, State, District, City, PinCode,FullAddress FROM dbo.UserMaster WHERE UserId=@UserId;
end 
go

alter procedure sp_ActivateUser
(@UserId nvarchar (50))
as
begin
UPDATE dbo.UserMaster 
SET AccountStatus ='Active' WHERE UserId=@UserId;
end 
go

create procedure sp_DeactivateUser
(@UserId nvarchar (50))
as
begin
UPDATE dbo.UserMaster 
SET AccountStatus ='Deactive' WHERE UserId=@UserId;
end 
go

create procedure sp_MakePending
(@UserId nvarchar (50))
as
begin
UPDATE dbo.UserMaster 
SET AccountStatus ='Pending' WHERE UserId=@UserId;
end 
go


alter procedure sp_insertBook
(
@BookId nvarchar (25),
@Title varchar (255),
@Authors varchar(max),
@PublicationYear nvarchar(5),
@Publisher varchar(50),
@Category varchar(50),
@Language varchar(50),
@Edition nvarchar(5),
@BookDescription Text,
@ImgLink nvarchar(max),
@pdfLink nvarchar(max)
)
as
begin 
insert into BooksMaster (BookId, Title,  Authors, PublicationYear, Publisher, Category , Language , Edition ,  BookDescription,CoverImgLink,PdfLink )
values(@BookId, @Title, @Authors, @PublicationYear, @Publisher, @Category , @Language , @Edition , @BookDescription,@ImgLink,@pdfLink)
end
go

alter procedure sp_updateBook
(
@BookId nvarchar (25),
@Title varchar (255),
@Authors varchar(max),
@PublicationYear nvarchar,
@Publisher varchar(50),
@Category varchar(50),
@Language varchar(50),
@Edition nvarchar,
@BookDescription Text
)
as begin
UPDATE BooksMaster
set Title = @Title,
Authors = @Authors,
PublicationYear = @PublicationYear,
Publisher = @Publisher,
Category = @Category,
Language = @Language,
Edition = @Edition,
BookDescription = @BookDescription
WHERE BookId = @BookId;
end 


create procedure BindBookTable

as begin
select BookId, Title, Language, Category, Authors, Publisher from BooksMaster; 
end 
go

create proc sp_UpdateUserDetail
(
@id nvarchar (50),
@fullName nvarchar(50),
@newPasswd nvarchar(50),
@dob nvarchar(50),
@contactNo nvarchar(50),
@state nvarchar(50),
@city nvarchar(50),
@pin nvarchar(50),
@fullAddress nvarchar(50)
)
as begin
Update UserMaster
set FullName = @fullName,
UserPassword = @newPasswd,
DateOfBirth = @dob,
ContactNo = @contactNo,
State = @state,
City = @city,
PinCode = @pin,
FullAddress = @fullAddress
where UserId = @id;
end 
go


create proc sp_GetPdfById
(
@BookId nvarchar(25)
)
as begin 
select PdfLink from BooksMaster where BookId = @BookId;
end 
go









