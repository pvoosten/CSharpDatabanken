CREATE TABLE [dbo].[Kamer] (
    [KamerId]           INT          IDENTITY (1, 1) NOT NULL,
    [Soort]             VARCHAR (50) NOT NULL,
    [NaamOfKamerNummer] VARCHAR (50) NOT NULL,
    [AantalPersonen]    INT          NOT NULL,
    [HotelId]           INT          NOT NULL,
    CONSTRAINT [AK_Kamer_hotelkamernummer] UNIQUE (HotelId, NaamOfKamerNummer), 
    CONSTRAINT [PK_Kamer] PRIMARY KEY ([KamerId]) 
);

