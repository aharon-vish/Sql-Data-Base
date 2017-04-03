USE [SocialNetWork]
GO

/* inser the name of users*/

INSERT INTO [User](FirstName,LastName,BirthDay,WorkPlace,City)
VALUES ('Aharon','Vishinsky','1987/07/19 ','Synerion','bnei-brak'),
       ('Miri','kropnik','1988/12/08','EL-AL','Bnei-brak'),
	   ('Moti','Polak','1987/07/07','AirCON','Kfar-Saba' ),
	   ('Lital','Saver','1988/05/01','Gilat','Tel-Aviv'),
	   ('Shlomi','Catriel','1990/12/12','insurance','Ramt-gan'),
	  ('Eliran','Abohat','1995/12/19','Security','Mahlla');
	 
go
/* inser the id of users*/
INSERT INTO 
Users(UsersID)
select UserID
from  [User];

go
/* inser the id of Album*/
INSERT INTO 
 Album(UserID,AlbumName,AlbumDescription,AlbumDate)
 VALUES(1,'thailand','vacation','1999/07/07'),
       (2,'barcelona','vacation','1999/4/7'),
	   (3,'David','school play','2014/12/11'),
	   (4,'Africa','Trip','2011/07/07'),
	   (5,'tokyo','Work','2011/08/08'),
	   (6,'Yemen','Project work','2013/12/08'),
	   (6,'Birthday 25','Birthday party','2014/09/12'),
	   (3,'Shmulik','Bar Mitzvah','2014/05/07');
 go
 /* inser the pic whit tag*/
 INSERT INTO 
 Picture(AlbumID,Picture,PictureDate)
 VALUES(2,'pic1','2005/12/11'),(2,'pic1','2012/11/11'),
        (2,'pic1','2005/10/11'),(6,'pic1','2010/10/1'),
       (3,'pic6','2004/12/11'),(6,'pic6','2009/07/07'),
       (4,'pic7','2004/04/11'),(6,'pic1','2014/02/02'),
       (5,'pic8','2004/03/11'),(8,'pic8','2008/02/11');

 go

 /*create post*/
 INSERT INTO 
 Post(UserPost,pictureID,AlbumID,post,PostDate)
 VALUES(1,6,null,'picture of lion......','2014/05/07'),
       (2,null,3,'some words','2008/11/06'),
	   (4,null,2,'more words','2009/05/07'),
	   (5,4,null,'bla bla bla','2012/05/08'),
	   (6,3,null,'dont say','2011/05/07'),
	   (5,7,null,'Project work','2011/05/12'),
	   (3,6,null,'Birthday party','2011/01/07'),
	   (2,5,null,'Bar Mitzvah','2011/01/08');

go

/*like*/
 INSERT INTO 
 [Like](IDLike,IDPost,IDPicture,IDAlbum)
 VALUES(1,null,null,2),
 (2,8,null,null),(1,8,null,null),
 (2,null,6,null),(4,8,null,null),
(1,5,null,null),(5,6,null,null),
 (4,6,null,null),(1,null,1,1);
 go

 /*Group*/
 INSERT INTO 
 Groups(MngID,NameGroup,PostID,Pictures)
 VALUES(1,'sql',null,3),
 (2,'c++',null,null),
 (3,'c#',7,null);
 go

 /*frieng in group*/

  INSERT INTO 
 GroupFriends(UserID,GroupID)
 VALUES(3,1),
 (1,1),(5,1),
 (3,2),(1,2),
 (2,1),(3,2),
 (5,3),(5,2),
 (1,3),(1,3),(2,3);
 go


 /*Messages*/
  INSERT INTO 
 [Messages](UserID,[in],[out],UserIDRessive,FromHow,[message],[Subject])
 VALUES(1,0,1,2,null,'How are you','no subject'),
 (1,1,0,null,2,'where are you','Work'),
 (3,1,0,null,2,'are gonna ?','play'),
 (4,0,1,5,null,'hi','sky'),
 (1,0,1,4,null,'so','fly'),
 (6,0,1,5,null,'have you make fun','nice to..'),
 (2,1,0,NULL,1,'BLA','BLA'),
 (2,1,0,NULL,1,'HI are gonna tp come ?','Friday'),
 (6,1,0,NULL,5,'What abut my computer','Computer'),
 (6,1,0,NULL,5,'SOME1','SOME1'),
 (1,1,0,NULL,2,'I out off words','Sory'),
 (1,0,1,NULL,5,'bla bla bla ','sory again');


 go


 /*Friends*/
   INSERT INTO 
 Friends(UserID,FriendID)
 VALUES(1,2),
 (1,3),
 (3,4),
 (2,1),
 (3,1),
 (6,1),
 (1,6),
 (5,1),(1,5),
 (5,2),(2,5),
 (5,3),(3,5),
 (4,5),(5,6),(6,4);
 go
 /*tag*/
 insert into
 TagUser (TagUser,PictureID)
 VALUES(1,1),(1,2),(1,3),(1,4),(1,5),(5,1),(6,1),(4,2),(4,3),(5,6),(1,8);
 
 /*14/1/15*/

