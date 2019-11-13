CREATE VIEW AlbumsPerArtiest
AS
SELECT al.Title as Album, ar.Name as Artiest
FROM Album al
JOIN Artist ar
	ON al.ArtistId = ar.ArtistId
	
-- Bovenstaand statement maakt een view aan
-- Een view is een schema-object en blijft bestaan in de databank tot `DROP AlbumsPerArtiest` wordt uitgevoerd
-- Je kan SELECT uitvoeren op een view, net zoals op een tabel
-- Als je `SELECT AlbumsPerArtiest` uitvoert, wordt het select statement uit de CREATE VIEW opnieuw uitgevoerd
-- Dus wijzigingen aan de tabellen waarvan gebruik wordt gemaakt zijn onmiddellijk zichtbaar.

-- Waarom views maken?
-- >> Overzicht te bewaren
-- >> Om toegang tot de database in detail te beheren.
