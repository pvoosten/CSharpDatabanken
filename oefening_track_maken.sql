BEGIN TRANSACTION

DECLARE @arId int = 2222;
DECLARE @arName varchar(100) = 'Artiest 2222';

DECLARE @albId int = 3333;
DECLARE @albTitle varchar(100) = 'Album 3333';

DECLARE @trkId int = 4444;
DECLARE @trkName varchar(100) = 'Track 4444';

SELECT COUNT(*)
FROM Artist
WHERE ArtistId = @arId

INSERT INTO Artist(ArtistId, Name)
VALUES(@arId, @arName)


SAVE TRANSACTION artiestGemaakt

INSERT INTO Album(AlbumId, ArtistId, Title)
VALUES(@albId, @arId, @albTitle)

ROLLBACK artiestGemaakt

INSERT INTO Track (AlbumId, Name, TrackId, UnitPrice)
VALUES(@albId, @trkName, @trkId, 9999)

ROLLBACK TRANSACTION