/*
Alles ok habe nur
- GEOGRAPHY statt GEOMETRY als Postgis-Datentyp genommen, das ist einfacher und implizit SRID 4326, das entspricht WGS 84, das ist die Standard-Kartenreferenz
- einige NOT NULL contraint bei Namen-Spalten hinzugefügt
*/

-- Aktivieren der PostGIS-Erweiterung (falls erforderlich)
CREATE EXTENSION IF NOT EXISTS postgis;

-- Erstellen der Tabelle "Region"
CREATE TABLE IF NOT EXISTS Region (
    Region_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Type VARCHAR(50),
    Geometry GEOGRAPHY,
    Elevation INTEGER,
    Parent_Region_ID INTEGER,
    FOREIGN KEY (Parent_Region_ID) REFERENCES Region(Region_ID) ON DELETE SET NULL
);

-- Erstellen der Tabelle "Farm"
CREATE TABLE IF NOT EXISTS Farm (
    Farm_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Size FLOAT,
    Region_ID INTEGER NOT NULL,
    FOREIGN KEY (Region_ID) REFERENCES Region(Region_ID) ON DELETE CASCADE
);

-- Erstellen der Tabelle "Climatezone"
CREATE TABLE IF NOT EXISTS Climatezone (
    Name VARCHAR(255) PRIMARY KEY
);

-- Erstellen der Tabelle "Crops"
CREATE TABLE IF NOT EXISTS Crops (
    Name VARCHAR(255) PRIMARY KEY
);

-- Erstellen der Tabelle "Measurement"
CREATE TABLE IF NOT EXISTS Measurement (
    Measurement_ID SERIAL PRIMARY KEY,
    Region_ID INTEGER NOT NULL,
    Date DATE NOT NULL,
    Temperature FLOAT,
    Precipitation FLOAT,
    FOREIGN KEY (Region_ID) REFERENCES Region(Region_ID) ON DELETE CASCADE
);

-- Erstellen der Tabelle "Region_Climatezone" für die n:m Beziehung
CREATE TABLE IF NOT EXISTS Region_Climatezone (
    Region_ID INTEGER NOT NULL,
    Climatezone VARCHAR(255) NOT NULL,
    PRIMARY KEY (Region_ID, Climatezone),
    FOREIGN KEY (Region_ID) REFERENCES Region(Region_ID) ON DELETE CASCADE,
    FOREIGN KEY (Climatezone) REFERENCES Climatezone(Name) ON DELETE CASCADE
);

-- Erstellen der Tabelle "Farm_Crops" für die n:m Beziehung
CREATE TABLE IF NOT EXISTS Farm_Crops (
    Farm_ID INTEGER NOT NULL,
    Crop_Name VARCHAR(255) NOT NULL,
    Area FLOAT,
    Amount FLOAT,
    PRIMARY KEY (Farm_ID, Crop_Name),
    FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID) ON DELETE CASCADE,
    FOREIGN KEY (Crop_Name) REFERENCES Crops(Name) ON DELETE CASCADE
);
