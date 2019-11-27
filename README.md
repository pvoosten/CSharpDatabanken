# [Huiswerk](Huiswerk.md)

# SELECT met en zonder FROM
Bereken de waarde van 386 keer 418 min 5443
## Oplossing
```sql
SELECT 386*418-5443
```
----
Bereken de vierkantswortel van 2 (functie SQRT)
## Oplossing
```sql
SELECT SQRT(2)
```
----
Geef de vierkantswortel van 2, de vierkantswortel van 30, de som van beide vierkantsworels en de vierkantswortel van de som van beiden.

## Oplossing
```sql
SELECT SQRT(2), SQRT(30),
  SQRT(2) + SQRT(30),
  SQRT(2+30)
```
----
Welk jaar zijn we nu?  
Tip: gebruik current_timestamp en de functie datepart

## Oplossing
```sql
SELECT DATEPART(yyyy, current_timestamp)
```
----
Welk jaar zijn we over 1000 dagen?  
Tip: je kan een aantal dagen optellen bij current_timestamp

## Oplossing
```sql
SELECT DATEPART(yyyy, current_timestamp+1000)
```
----
Toon alle gegevens in de tabel dbo.Artist

## Oplossing
```sql
SELECT *
FROM dbo.Artist
```
----
Toon enkel de namen van de verschillende artiesten (tabel Artist)

## Oplossing
```sql
SELECT DISTINCT Name
FROM dbo.Artist
```
----
Geef voornaam, familienaam en land van alle klanten (tabel customer).  
Zorg dat de kolomnaam in het Nederlands wordt weergegeven

## Oplossing
```sql
SELECT voornaam = FirstName, -- alias met =, als prefix
 LastName familienaam, -- alias als suffix
 Country AS land -- alias met AS
FROM Customer
```
----
Geef de landen waarin de klanten wonen (kolom country in tabel customer).  
Zorg dat elk land maar 1 keer in het resultaat voorkomt

## Oplossing
```sql
SELECT DISTINCT country
FROM Customer
```
----
Hoeveel klanten zijn er (tabel customers)?

## Oplossing
```sql
SELECT count(*)
FROM Customer
```
----
In hoeveel verschillende landen wonen de klanten?

## Oplossing
```sql
SELECT count(DISTINCT Country)
FROM Customer
```
----
Bekijk de documentatie van CASE: https://docs.microsoft.com/en-us/sql/t-sql/language-elements/case-transact-sql?  view=sql-server-2017  
Maak van de tabel Customer een overzicht met kolommen voornaam, familienaam en plaats.  
Voornaam en familienaam zijn aliassen van de FirstName en LastName kolommen  
Plaats is het land (Country) als dat niet gelijk is aan USA of Canada.  
Als het land gelijk is aan 'USA', geef dan State + ' (US)' weer.  
Als het land Canada is, geef dan Country + ' (' + State + ')' weer.

## Oplossing
```sql
SELECT FirstName voornaam,
 LastName familienaam,
 CASE Country
  WHEN 'USA'
   THEN [State] + ' (US)'
  WHEN 'Canada'
   THEN Country + ' (' + [State] + ')'
  ELSE Country
  END AS plaats
FROM Customer
```
----
Bekijk de documentatie van CASE: https://docs.microsoft.com/en-us/sql/t-sql/language-elements/case-transact-sql?  view=sql-server-2017  
Maak van de tabel Customer een overzicht met kolommen voornaam, familienaam en plaats.  
Voornaam en familienaam zijn aliassen van de FirstName en LastName kolommen  
Plaats is het land (Country) als State NULL is.  
Als State niet NULL is, geef je "State (Country)" weer

## Oplossing
```sql
SELECT FirstName voornaam,
 LastName familienaam,
 CASE 
  WHEN [State] IS NULL
   THEN Country
  ELSE [State] + ' (' + Country + ')'
  END AS plaats
FROM Customer
```
----
Oefening met COALESCE: https://docs.microsoft.com/en-us/sql/t-sql/language-elements/coalesce-transact-sql?view=sql-server-2017  
Geef van de tabel Customer de landen (Country) en deelstaten of provincies (State) waar klanten wonen.  
Als er voor een land geen deelstaat of provincie is (dus als de waarde in die kolom NULL is), geef dan '(heel het land)' weer in plaats van NULL.

## Oplossing
```sql
SELECT DISTINCT Country AS land,
 COALESCE([State], '(heel het land)')
FROM Customer
```
----
Oefening met NULLIF: https://docs.microsoft.com/en-us/sql/t-sql/language-elements/nullif-transact-sql?view=sql-server-2017  
Gebruik NULLIF om NULL weer te geven in kolom "zelfde"  
Gebruik NULLIF met 2 verschillende waarden om 'anders' weer te geven in kolom "verschillend"

## Oplossing
```sql
SELECT nullif(1, 1) zelfde,
 nullif('anders', 'x') verschillend
```
# SELECT met WHERE
Geef de voornaam en familienaam van alle klanten die in België wonen

## Oplossing
```sql
SELECT firstname,
 lastname
FROM customer
WHERE country = 'Belgium'
```
----
Geef voornaam en familienaam van alle klanten die in België of Frankrijk wonen  
Gebruik OR

## Oplossing
```sql
SELECT firstname,
 lastname
FROM customer
WHERE country = 'Belgium' or country = 'France'
```
----
Geef voornaam en familienaam van alle klanten die in België of Frankrijk wonen  
Gebruik geen OR, maar wel IN

## Oplossing
```sql
SELECT firstname,
 lastname
FROM customer
WHERE country IN('Belgium', 'France')
```
----
Geef de naam van de tracks die minder dan 2 minuten duren.
Geef ook de duurtijd van de track in  minuten en seconden (tot 3 cijfers na de komma).
Gebruik aparte kolommen voor minuten en seconden, of probeer er een string van te maken in de vorm '00:00.000'
Je kan gebruik maken van de kolom Milliseconds om de tijd van een track in milliseconden te weten.

## Oplossing
```sql
SELECT name,
 FLOOR(Milliseconds / 60000) minuten,
 FLOOR((Milliseconds % 60000) / 1000) seconden,
 Milliseconds % 1000 millis
FROM Track
WHERE Milliseconds < 2 * 60 * 1000
```
----
Geef de naam en de duurtijd van de tracks die tussen de 2 en de 3 minuten duren.
Gebruik het sleutelwoord BETWEEN

## Oplossing
```sql
SELECT name,
 Milliseconds / 1000 duurtijdSeconden
FROM Track
WHERE Milliseconds BETWEEN 2 * 60 * 1000
  AND 3 * 60 * 1000
```
----
Geef de naam van de tracks die langer dan 3 minuten duren en tussen 1.5 en 2.5 dollar kosten.

## Oplossing
```sql
SELECT name
FROM Track
WHERE Milliseconds > 3 * 60 * 1000
	AND UnitPrice BETWEEN 1.5 AND 2.5
```
----
Geef het aantal tracks en het aantal verschillende albums die tracks bevatten waarvoor de componist (kolom composer) bekend is.
Gebruik enkel de tabel Track om het antwoord te vinden.
Gebruik de kolomaliassen aantalTracks en aantalAlbums om duidelijk weer te geven wat werd geteld.

## Oplossing
```sql
SELECT count(*) aantalTracks,
 count(DISTINCT albumId) aantalAlbums
FROM Track
WHERE Composer IS NOT NULL
```
# SELECT met JOINs
Hoeveel artiesten zijn er die geen album hebben? Of minder specifiek verwoord: zijn er artiesten opgeslagen in de database waarvoor er geen album is?
Los op met een outer join en met IS (NOT) NULL in de WHERE clause. 

## Oplossing
```sql
SELECT count(*)
FROM Artist
LEFT OUTER JOIN Album ON Artist.ArtistId = Album.ArtistId
WHERE album.Title IS NULL
```
----
Maak een overzicht van albumnaam en artiestnaam voor alle albums die terug te vinden zijn in de Chinook database.

## Oplossing
```sql
SELECT al.Title album,
 art.Name artiest
FROM Album al
JOIN Artist art ON al.ArtistId = art.ArtistId
```
----
Maak voor alle tracks een overzicht van tracknaam, albumnaam, artiestnaam, naam mediatype, naam genre.
Hou er rekening mee dat een track niet altijd een genre heeft. Een track heeft ook niet altijd een album.

## Oplossing
```sql
SELECT t.Name track,
 a.Title album,
 art.Name artiest,
 m.Name mediatype,
 g.Name genre
FROM Track t
LEFT OUTER JOIN Album a ON t.AlbumId = a.AlbumId
LEFT OUTER JOIN Artist art ON a.ArtistId = art.ArtistId
LEFT OUTER JOIN MediaType m ON t.MediaTypeId = m.MediaTypeId
LEFT OUTER JOIN Genre g ON t.GenreId = g.GenreId
```
# SELECT met GROUP BY en HAVING
Maak een overzicht van de albums met titel, naam artiest, aantal tracks, totale duur van het album (functie SUM), gemiddelde duur per track (functie AVG) en een door komma's gescheiden lijst van de tracknamen.
Gebruik de functie STRING_AGG om de lijst met tracks in 1 cel van het resultaat te maken.

## Oplossing
```sql
SELECT a.Title album,
 (
  SELECT name
  FROM artist
  WHERE ArtistId = a.ArtistId
  ) [naam artiest],
 count(t.trackId) [aantal tracks],
 sum(t.milliseconds) / 60000 [minuten volledig album],
 avg(t.milliseconds) / 60000.0 [minuten per track gemiddeld],
 string_agg(t.name, ', ') [tracks in album]
FROM album a
JOIN track t ON a.AlbumId = t.AlbumId
GROUP BY a.Title,
 a.ArtistId
```

Alternatieve oplossing:
```sql
SELECT 
	Album.Title,
	Artist.Name, Count(*) [aantal tracks],
	SUM(Track.Milliseconds),
	AVG(Track.Milliseconds)
	,string_agg(Track.Name, ',' )
FROM Album JOIN Artist ON Artist.ArtistId = Album.ArtistId
		LEFT JOIN Track ON TRack.AlbumId = Album.AlbumId
GROUP BY
	Album.AlbumId,
	Album.Title,
	Artist.Name
```

----
Geef per playlist de naam en het aantal tracks. Je hebt zowel een JOIN als een GROUP BY nodig.

## Oplossing
```sql
SELECT p.name,
 count(*) [Aantal tracks]
FROM Playlist p
JOIN PlaylistTrack t ON p.PlaylistId = t.PlaylistId
GROUP BY p.Name
```
# SELECT met de set operatoren UNION EXCEPT INTERSECT
Maak een lijst van alle voornamen die zowel de voornaam van een Employee als van een Customer zijn.
Gebruik daarvoor 2 queries die je combineert met INTERSECT.

## Oplossing
```sql
SELECT firstname
FROM Employee

INTERSECT

SELECT firstname
FROM Customer
```
----
Maak een lijst van alle voornamen van Customers die geen voornaam zijn van een Employee.
Gebruik daarvoor 2 queries die je combineert met EXCEPT.

## Oplossing
```sql
SELECT firstname
FROM Customer

EXCEPT

SELECT firstname
FROM Employee
```
----
Maak een lijst van alle voornamen van Customers die ook de voornaam zijn van een Employee.
Gebruik daarvoor 2 queries die je combineert met INTERSECT

## Oplossing
```sql
-- (zelfde vraag als een eerdere vraag)
```
----
Geef de voornamen van zowel employees als customers.
Gebruik UNION zodanig dat elke voornaam maar 1 keer voorkomt.
## Oplossing
```sql
SELECT firstname
FROM Customer

UNION

SELECT firstname
FROM Employee
```
----
Geef de voornamen van zowel employees als customers.
Gebruik UNION zodat voornamen die meerdere keren voorkomen ook meerdere keren in het resultaat voorkomen.
## Oplossing
```sql
SELECT firstname
FROM Customer

UNION ALL

SELECT firstname
FROM Employee
```
----
# Parameters en DECLARE en SET
Probeer de volgende query uit
DECLARE dient om parameters (die beginnen met @) te declareren
SET dient om een waarde aan een parameter toe te kennen
De parameters kunnen op bepaalde plaatsen in DML statements gebruikt worden

```sql
DECLARE @foo VARCHAR(100);

SET @foo = 'foobar';

SELECT @foo
```
## Oplossing
```sql
-- er is geen oplossing, gewoon uitvoeren wat er staat
```
----
Voer volgend statement uit.
Het lukt niet om dit uit te voeren. Geen paniek.
Lees de foutmeldingen. Begrijp je wat het probleem is?

```sql
DECLARE @landEnStaat VARCHAR(100)

SET @landEnStaat = CASE STATE
  WHEN 'onbekend'
   THEN Land
  ELSE STATE + ' (' + Land + ')'
  END

SELECT @landEnStaat
FROM Chinook.dbo.Customer
```
## Oplossing
```sql
-- Een parameter kan een waarde toegewezen krijgen,
-- niet een uitdrukking met verwijzingen die nog
-- niet gedeclareerd zijn.
```
----
Geef de vierkantswortel van 2, de vierkantswortel van 30, de som van beide vierkantsworels en de vierkantswortel van de som van beiden.
Declareer parameters in plaats van 2 en 30 letterlijk te gebruiken.
Zet de waarde van de parameters op 2 en 30 en voer uit.
Probeer ook eens uit met andere waarden.

## Oplossing
```sql
DECLARE @twee INT,
 @dertig INT

SET @twee = 2
SET @dertig = 30

SELECT SQRT(@twee),
 SQRT(@dertig),
 SQRT(@twee) + SQRT(@dertig),
 SQRT(@twee + @dertig)
```
# Subqueries in WHERE met IN ANY ALL
Hoeveel artiesten zijn er die geen album hebben? Of minder specifiek verwoord: zijn er artiesten opgeslagen in de database waarvoor er geen album is?
Los op met een ANY subquery. 

## Oplossing
```sql
SELECT *
FROM Artist a
WHERE NOT a.ArtistId = ANY (
  SELECT ArtistId
  FROM Album
  )
```
----
Geef de voornaam en familienaam van alle klanten (Customer) waarvoor er een medewerker (Employee) bestaat met dezelfde voornaam.
Los op met een niet-gelinkte subquery.

## Oplossing
```sql
SELECT firstname,
 lastname
FROM Customer
WHERE Customer.FirstName = ANY (
  SELECT firstname
  FROM employee
  )
```
----
Geef de voornaam en familienaam van alle klanten (Customer) waarvoor er een medewerker (Employee) bestaat met dezelfde voornaam.
Los op met een niet-gelinkte subquery, gedeclareerd in een parameter (dus met DECLARE en SET).

## Oplossing
```sql
DECLARE @firstname TABLE (FirstName VARCHAR(100))

INSERT INTO @firstname
SELECT firstname
FROM Employee

SELECT firstname
	,lastname
FROM Customer
WHERE firstname IN (
		SELECT *
		FROM @firstname
		)
```

# INSERT UPDATE en DELETE
Gebruik letterlijke waarden in een INSERT statement om een record met je eigen naam toe te voegen aan de tabel Customers.
Vul alleen de waarden in die nodig zijn.

## Oplossing
```sql
INSERT INTO Customer (
 CustomerId,
 FirstName,
 LastName,
 Email
 )
VALUES (
 - 999,
 'Foo',
 'Vandebar',
 'foo@fooobar.com'
 )
```
----
Declareer parameters en initialiseer de waarde ervan om te gebruiken in een insert statement waarmee je jezelf toevoegt aan de tabel Employee.

## Oplossing
```sql
DECLARE @firstname VARCHAR(100),
 @lastname VARCHAR(100)
DECLARE @employeeId INT

SET @firstname = 'Tijs'
SET @lastname = 'Boerke'
SET @employeeId = - 99

INSERT INTO Employee (
 FirstName,
 LastName,
 EmployeeId
 )
VALUES (
 @firstname,
 @lastname,
 @employeeId
 )
```
----
Voer een aankoop uit: maak factuur (Invoice) met een aangekocht artikel (InvoiceLine).
Je hebt hiervoor 2 insert statements nodig.

## Oplossing
```sql
DECLARE @prijs DECIMAL(10,2) = 3.99

BEGIN TRANSACTION

INSERT INTO [dbo].[Invoice] (
	[InvoiceId]
	,[CustomerId]
	,[InvoiceDate]
	,[BillingAddress]
	,[BillingCity]
	,[BillingState]
	,[BillingCountry]
	,[BillingPostalCode]
	,[Total]
	)
VALUES (
	1000
	,58
	,N'2013-12-22 00:00:00'
	,N'12,Community Centre'
	,N'Delhi'
	,NULL
	,N'India'
	,N'110017'
	,@prijs
	)

INSERT INTO [dbo].[InvoiceLine] (
	[InvoiceLineId]
	,[InvoiceId]
	,[TrackId]
	,[UnitPrice]
	,[Quantity]
	)
VALUES (
	9999
	,1000
	,16
	,@prijs
	,1
	)

COMMIT TRANSACTION

```
----
Schrijf een DELETE statement waarmee je alle Artists verwijdert die geen album hebben.

## Oplossing
```sql
DELETE
FROM Artist
WHERE Artist.ArtistId NOT IN (
  SELECT ArtistId
  FROM Album
  )
```
----
Verhoog de prijs van 0.99 naar 1.49 voor alle tracks die 0.99 kosten en langer dan 5 minuten duren (UnitPrice in de tabel Track).

## Oplossing
```sql
UPDATE Track
SET UnitPrice = 1.49
WHERE UnitPrice = 0.99 AND Milliseconds > 5 * 60 * 1000
```

# ORDER BY en TOP
Geef de voor de tracks het aantal minuten (gebruik de FLOOR functie om het aantal minuten naar beneden af te ronden).
Geef ook de naam en de prijs van de track.
Selecteer enkel de tracks die minder dan 10 minuten duren.
Orden de tracks aflopend op aantal minuten (afgerond naar beneden), en daarna oplopend op de prijs per track.

## Oplossing
```sql
SELECT FLOOR(Milliseconds / 60000) minuten,
 Name,
 UnitPrice
FROM Track
WHERE Milliseconds < 10 * 60 * 1000
ORDER BY minuten DESC,
 UnitPrice ASC
-- merk op dat een kolomalias uit de SELECT
-- clause kan gebruikt worden in de ORDER BY
-- clause.
```
----
Geef de voor de tracks het aantal minuten (gebruik de FLOOR functie om het aantal minuten naar beneden af te ronden).
Geef ook de naam en de prijs van de track.
Selecteer enkel de tracks die minder dan 10 minuten duren.
Orden de tracks aflopend op aantal minuten (afgerond naar beneden), en daarna oplopend op de prijs per track.
Gebruik SELECT TOP om enkel de eerste 100 tracks weer te geven.

## Oplossing
```sql
SELECT TOP 100
 FLOOR(Milliseconds / 60000) minuten,
 Name,
 UnitPrice
FROM Track
WHERE Milliseconds < 10 * 60 * 1000
ORDER BY minuten DESC,
 UnitPrice ASC
```
----
Geef de voor de tracks het aantal minuten (gebruik de FLOOR functie om het aantal minuten naar beneden af te ronden).
Geef ook de naam en de prijs van de track.
Selecteer enkel de tracks die minder dan 10 minuten duren.
Orden de tracks aflopend op aantal minuten (afgerond naar beneden), en daarna oplopend op de prijs per track.
Gebruik SELECT TOP in combinatie met DECLARE en SET om enkel de eerste @aantal tracks weer te geven.
Gebruik ook DECLARE en SET om de maximum tracklengte in te stellen.

## Oplossing
```sql
DECLARE @maxMinuten NUMERIC
DECLARE @aantalRecords INT

SET @aantalRecords = 25
SET @maxMinuten = 6

SELECT TOP (@aantalRecords) Milliseconds / 60000 minuten,
 Name,
 UnitPrice
FROM Track
WHERE Milliseconds < @maxMinuten * 60 * 1000
ORDER BY minuten DESC,
 UnitPrice ASC
```
