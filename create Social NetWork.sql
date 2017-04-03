CREATE DATABASE SocialNetWork ;
GO
USE [SocialNetWork]
GO

CREATE TABLE [User]
(
UserID int IDENTITY(1,1) primary key not null,
FirstName varchar(10) not null,
LastName varchar(10) not null,
BirthDay date,
WorkPlace varchar(10),
City varchar(10)
);
GO

CREATE TABLE Friends
(
UserID INT NOT NULL,
FriendID int not null
);
go
create table GroupFriends
(
UserID int not null,
GroupID int not null
);
go

create table Users
(
UsersID int not null UNIQUE
);


go

CREATE TABLE [Messages]
(
Idmessage int IDENTITY(1,1) primary key not null ,
UserID int not null,
[in] Bit,
[out] Bit,
UserIDRessive int ,
FromHow int,
[message] varchar(255),
[Subject] varchar(10) not null

);
GO

create table Groups
(
Groupid int IDENTITY(1,1) primary key not null,
MngID int not null ,
NameGroup varchar(20) not null,
PostID int,
Pictures int
);

go

CREATE TABLE Album
(
AlbumID int IDENTITY(1,1) primary key not null,
UserID int not null,
AlbumName varchar(20) not null,
AlbumDescription varchar(20) not null,
AlbumDate date
);
GO


CREATE TABLE Picture
(
pictureID int IDENTITY(1,1) primary key not null,
AlbumID int not null ,
--TagUser int,
Picture char(10) not null,
PictureDate date
--CONSTRAINT  fk_TagUser FOREIGN KEY(TagUser)
--REFERENCES Users(UsersID)
);
GO

CREATE TABLE Post
(
PostID int IDENTITY(1,1) primary key not null ,
UserPost int not null,
pictureID int,
AlbumID int ,
post varchar(255),
PostDate date,
CONSTRAINT  fk_UserPost FOREIGN KEY(UserPost)
REFERENCES Users(UsersID)

);
 
 go

CREATE TABLE [Like]
(
IDLike int not null,
IDPost int ,
IDPicture int,
IDAlbum int

);
GO

CREATE TABLE TagUser
(
TagUser int not null,
PictureID int not null

);
GO

/* user-userid(nn,pk,inc) -> album-userid(nn,fk),album-albumid(nn,pk,inc)*/
ALTER TABLE Album
ADD FOREIGN KEY (UserID)
REFERENCES [User](UserID)
go

/*album-albumid(nn,pk,inc) ->pictur-albumid(nn,fk)*/
ALTER TABLE Picture
ADD FOREIGN KEY (AlbumID)
REFERENCES Album(AlbumID)
go
/*album-albumid ->post-albumid*/
ALTER TABLE Post
ADD FOREIGN KEY (AlbumID)
REFERENCES Album(AlbumID)
go

/*pic-picid->post-picid*/
ALTER TABLE Post
ADD FOREIGN KEY (pictureID)
REFERENCES Picture(pictureID)
go


/*User-UserID->Users-Userid*/
ALTER TABLE Users
ADD FOREIGN KEY (UsersID)
REFERENCES [User](UserID)
go

/*post-postid -> like-idlike*/
ALTER TABLE [Like]
ADD FOREIGN KEY (IDPost)
REFERENCES Post(PostID)
go

/*user-userid->Like-useridLike*/
ALTER TABLE [Like]
ADD FOREIGN KEY (IDLike)
REFERENCES [User](UserID)
go
/*Picture-pictureID -> like-IDPicture*/
ALTER TABLE [Like]
ADD FOREIGN KEY (IDPicture)
REFERENCES Picture(pictureID)
go

/*Album-AlbumID -> like-IDAlbum*/
ALTER TABLE [Like]
ADD FOREIGN KEY (IDAlbum)
REFERENCES Album(AlbumID)
go

/*[Group]-PostID -> Post-PostID*/
ALTER TABLE [Groups]
ADD FOREIGN KEY (PostID)
REFERENCES Post(PostID)
go

/*[GroupFriends]-UserID -> [User]-UserID*/
ALTER TABLE GroupFriends
ADD FOREIGN KEY (UserID)
REFERENCES [User](UserID)
go

/*GroupFriends-GroupID(nn,pk,inc)->Group-GroupID(nn,fk)*/
ALTER TABLE GroupFriends
ADD FOREIGN KEY (GroupID)
REFERENCES [Groups](GroupID)
go


/*user-userid->Group-MngID(nn,fk)*/
ALTER TABLE Groups
ADD FOREIGN KEY (MngID)
REFERENCES [user](userid)
go


/*Messages-UserID(nn,fk)->[user]-userid*/
ALTER TABLE  Messages
ADD FOREIGN KEY (UserID)
REFERENCES [user](userid)
go

/*Messages-UserIDRessive(nn,fk)->[Users]-UsersID*/
ALTER TABLE  Messages
ADD FOREIGN KEY (UserIDRessive)
REFERENCES Users(UsersID)
go

/*Messages-FromHow(nn,fk)->[Users]-UsersID*/
ALTER TABLE  Messages
ADD FOREIGN KEY (FromHow)
REFERENCES Users(UsersID)
go

/*Friends-UserID(nn,fk)->User-UserID*/
ALTER TABLE  Friends
ADD FOREIGN KEY (UserID)
REFERENCES [User](UserID)
go


/*Friends-UserID(nn,fk)->User-UserID*/
ALTER TABLE  Friends
ADD FOREIGN KEY (FriendID)
REFERENCES Users(UsersID)
go
/*tag ref*/
alter table TagUser
ADD FOREIGN KEY (PictureID)
REFERENCES Picture(pictureID)
go

alter table TagUser
ADD FOREIGN KEY (TagUser)
REFERENCES Users(UsersID)
go

/*14/1/15*/







