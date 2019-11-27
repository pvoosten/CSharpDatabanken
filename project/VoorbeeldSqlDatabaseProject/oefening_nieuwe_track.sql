/*
Oefening:

Maak in een transactie
 - een nieuwe track
 - van een nieuw album
 - van een nieuwe artiest

*/

BEGIN TRANSACTION

DECLARE @artistIdBestaat bit;

SELECT @artistIdBestaat = COUNT(*)
FROM Artist
WHERE ArtistId = 1111;