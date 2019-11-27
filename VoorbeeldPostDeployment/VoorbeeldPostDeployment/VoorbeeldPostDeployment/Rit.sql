CREATE TABLE [dbo].[Rit]
(
	[RitId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Starttijd] DATETIME NOT NULL, 
    [Startplaats] NCHAR(100) NOT NULL, 
    [ChauffeurId] INT NULL, 
    CONSTRAINT [AK_Rit] UNIQUE (Starttijd, Startplaats, ChauffeurId), 
    CONSTRAINT [FK_Rit_Chauffeur] FOREIGN KEY (ChauffeurId)
		REFERENCES [Chauffeur]([ChauffeurId])
)
