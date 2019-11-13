# 13 november 2019

 + Maak een tabel InvoiceLine2 met de kolommen van Chinook.dbo.InvoiceLine,
maar zonder de constraints
 + Steek alle gegevens erin uit de originele tabel met een insert-met-select statement
 + Zet de knop in een query-venster aan om het execution plan van een query te bekijken
 + Voer een SELECT statement uit van de tabel InvoiceLine2 met in de WHERE-clause de kolom TrackId
 + Bekijk het execution plan
 + Maak nu een index aan op de kolom TrackId van InvoiceLine2
 + Open een nieuw queryvenster en voer hetzelfde SELECT statement opnieuw uit, opnieuw met het execution plan erbij.
 + Vergelijk beide execution plans. Kan je terugvinden waar de index gebruikt werd?


## Veel op veel relaties

 + Tabel Product met kolom ProductId (PK)
 + Tabel Leverancier met kolom LeverancierId (PK)

## Opgaven

Maak een databasestructuur met tabellen en constraints
zodat aan de volgende voorwaarden voldaan is.

Is er een 1 op veel relatie of een veel op veel relatie?

Alle opgaven staan los van elkaar

 1. Een product moet door verschillende 
    leveranciers geleverd kunnen worden,
	een leverancier levert meerdere producten

 2. Een product kan altijd maar door 1 leverancier
    geleverd worden.

 3. Een product kan per jaar maar door 1 leverancier 
    geleverd worden.
