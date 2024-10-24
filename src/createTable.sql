use Posts
go
create table Users
(
	iduser uniqueidentifier primary key
	,username varchar(16)
	,passwd	varchar(64)
	,email varchar(64)
	,created date
	,active bit
)
go
create table People
(
	id int identity(1,1)
	,iduser uniqueidentifier references Users(iduser)
	,name varchar(64)
	,lastname varchar(128)
	,phone varchar(16)
	,birthdate date
	,sex bit
	,created date
)