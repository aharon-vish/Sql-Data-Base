use[SocialNetWork]
go
/*Show User’s News Feed*/
select post
from post
where UserPost in (select FriendID
                  from  Friends
				  where UserID=1)


/*Show Users in my groups */
select distinct UserID
from GroupFriends
where GroupID in (select distinct GroupID
                  from  GroupFriends
				  where UserID=1)

/*What are the Highlight posts?*/

select  IDPost
 from  [Like]
 where IDPost != 0
 group by IDPost
 order by IDPost desc

 /* Users I may know */

	( select DISTINCT UserID
              from Friends
                 where UserID!=1 AND UserID  NOT IN
                                                  (select FriendID
                                                     from Friends
                                                        where UserID=1))
 

 /*Best Friend*/

  select distinct UserID,max(FromHow)BestFiernd
    from  [Messages]
    where FromHow!=0
    group by UserID


/* Portrait */
SELECT 
TagUser.PictureID,TagUser.NumPeoplesInPhoto,tag1.TagUser as [User Number]
FROM
(select PictureID,TagUser from TagUser)tag1
       INNER  join  
	   (select PictureID,count(TagUser) as NumPeoplesInPhoto from TagUser group by PictureID) TagUser
						 on 
						 tag1.PictureID=TagUser.PictureID
						 where TagUser.NumPeoplesInPhoto=1


 /*Administrator Statistics*/
 select  year(pos.PostDate),count(pos.PostDate) as [How many posts Upload]
 from Post pos
 group by  year(pos.PostDate)


  select year(Al.AlbumDate),count(Al.AlbumDate)
 from Album Al
 group by  year(Al.AlbumDate)

  select  year(pic.PictureDate),count(pic.PictureDate)
 from Picture pic
  group by year(pic.PictureDate)


  /*We like our picture*/

  select PictureID
  from
  (select TagUser , PictureID
  from TagUser ) tag
  inner join
  (select IDLike,IDPicture
  from [Like]
  where IDPicture!=0)lik         
 on lik.IDLike=tag.TagUser and  lik.IDPicture=tag.PictureID




 /*14/01/15*/