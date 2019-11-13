CREATE VIEW AlbumsPerArtiest
AS
SELECT al.Title as Album, ar.Name as Artiest
FROM Album al
JOIN Artist ar
	ON al.ArtistId = ar.ArtistId
