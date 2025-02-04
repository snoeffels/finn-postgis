/*
    Dieses Script benutzen wir um die Datenbank zurückzusetzen.
    Ausführen kann man es einfach per copy+paste unter https://www.eberle-zentrum.uni-tuebingen.de/lehre/db24w/_settings/?mode=plugin&func=cockpit_sql
*/

DELETE FROM Farm_Crops;
DELETE FROM Region_Climatezone;
DELETE FROM Measurement;
DELETE FROM Crops;
DELETE FROM Climatezone;
DELETE FROM Farm;
DELETE FROM Region;

TRUNCATE TABLE Farm_Crops, Region_Climatezone, Measurement, Crops, Climatezone, Farm, Region RESTART IDENTITY CASCADE;