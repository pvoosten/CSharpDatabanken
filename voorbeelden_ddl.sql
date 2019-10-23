-- select * from TweedeTabel
--INSERT INTO TweedeTabel (
--	Id
--	,Naam
--	)
--VALUES (
--164, 
--'honderdvierenzestig')


--insert into TweedeTabel(Id, Naam)
--values(45, NULL)


-- select * from TweedeTabel

--UPDATE TweedeTabel
--SET Naam = 'Bart'
--WHERE Id = 45


--UPDATE TweedeTabel
--SET Naam = 'Bart'
--WHERE 1=0

--INSERT INTO TweedeTabel (Naam, Id)
--VALUES ('Thomas', 1982)



--CREATE TABLE [dbo].TweedeTabel
--(
--	[Id] INT NOT NULL, 
--    [Naam] VARCHAR(20) NULL,
--	foo datetime2(3) not null default current_timestamp
--)


--insert into TweedeTabel(id)
--values (1000)

-- select * from TweedeTabel





--CREATE TABLE [dbo].TweedeTabel
--(
--	[Id] INT NOT NULL, 
--    [Naam] VARCHAR(20) NULL,
--	foo datetime2(3) not null default current_timestamp, 
--    [bar] DECIMAL(18, 5) NULL -- geen default value !!!
--)

-- select * from TweedeTabel




--CREATE TABLE [dbo].TweedeTabel
--(
--	[Id] INT IDENTITY, 
--    [Naam] VARCHAR(20) NULL,
--	foo datetime2(3) not null default current_timestamp, 
--    [bar] DECIMAL(18, 5) NULL
--)

insert into TweedeTabel(Naam)
values ('Trump')

select * from TweedeTabel


drop table TweedeTabel

CREATE TABLE [dbo].TweedeTabel
(
	[Id] INT IDENTITY(2019001, 1), 
    [Naam] VARCHAR(20) NULL,
	foo datetime2(3) not null default current_timestamp, 
    [bar] DECIMAL(18, 5) NULL -- geen default value !!!
)

select * from TweedeTabel



