﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


INSERT INTO Chauffeur(Naam) VALUES('Anne Vandenabeele')
INSERT INTO Chauffeur(Naam) VALUES('Arne Vandewiele')


INSERT INTO Rit(ChauffeurId, Startplaats, Starttijd)
VALUES(1, 'Kortrijk', 16/11/2019)


