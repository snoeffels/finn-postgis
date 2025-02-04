DELETE FROM Farm_Crops;
DELETE FROM Region_Climatezone;
DELETE FROM Measurement;
DELETE FROM Crops;
DELETE FROM Climatezone;
DELETE FROM Farm;
DELETE FROM Region;

TRUNCATE TABLE Farm_Crops, Region_Climatezone, Measurement, Crops, Climatezone, Farm, Region RESTART IDENTITY CASCADE;