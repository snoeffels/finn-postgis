/*
    Dieses Script benutzen wir um die Daten in die Datenbank.
    Ausführen kann man es einfach per copy+paste unter https://www.eberle-zentrum.uni-tuebingen.de/lehre/db24w/_settings/?mode=plugin&func=cockpit_sql
*/


/*
======
REGION
======
*/

INSERT INTO Region (Name, Type, Geometry, Elevation, Parent_Region_ID) VALUES
('North Province', 'Province', ST_GeogFromText('POLYGON((8.5 13.0, 14.4 12.7, 16.2 8.6, 14.5 6.4, 12.3 4.3, 9.6 2.8, 8.5 13.0))'), 500, NULL),