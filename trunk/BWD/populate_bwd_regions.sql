TRUNCATE bwd_regions;
INSERT INTO bwd_regions
SELECT cc, Region,
  COUNT(IF(SeaWater = 'O', 1, NULL)) AS coast_stations,
  COUNT(IF(SeaWater = 'N', 1, NULL)) AS freshwater_stations
FROM bwd_stations
GROUP BY cc, Region;