-- SOURCE: https://en.wikipedia.org/wiki/List_of_cities_proper_by_population

DECLARE @CITYSTATS TABLE (ID INT, CITYNAME NVARCHAR(100), POPULATION BIGINT, CITYTYPE VARCHAR(100), COUNTRY VARCHAR(100))
INSERT INTO @CITYSTATS (ID, CITYNAME, POPULATION, CITYTYPE, COUNTRY)
VALUES
(1 , 'Chongqing', 30165500 , 'Municipality', 'China'),
(2 , 'Shanghai', 24183300 , 'Municipality', 'China'),
(3 , 'Beijing', 21707000 , 'Municipality', 'China'),
(4 , 'Istanbul', 15029231 , 'Metropolitan municipality', 'Turkey'),
(5 , 'Karachi', 14910352 , 'City' , 'Pakistan'),
(6 , 'Dhaka', 14399000 , 'Capital city', 'Bangladesh'),
(7 , 'Tokyo', 13515271 , 'Capital city', 'Japan'),
(8 , 'Moscow', 13200000 , 'Federal city' , 'Russia'),
(9 , 'Guangzhou', 13081000 , 'City (sub-provincial) ', 'China'),
(10 , 'Shenzhen', 12528300 , 'City (sub-provincial) ', 'China'),
(11 , 'Mumbai', 12442373, 'City' , 'India'),
(12 , 'São Paulo', 12038000 , 'Municipality' , 'Brazil'),
(13 , 'Kinshasa', 11462000 , 'City province' , 'Democratic Republic of the Congo'),
(14 , 'Tianjin', 11249000 , 'Municipality', 'China'),
(15 , 'Lahore', 11126000 , 'Metropolitan area', 'Pakistan'),
(16 , 'Delhi', 11034555, 'City', 'India'),
(17 , 'Jakarta', 10624000 , 'Special capital region' , 'Indonesia'),
(18 , 'Dongguan', 10615000 , 'City', 'China'),
(19 , 'Seoul', 9806000 , 'Special city', 'South Korea'),
(20 , 'Foshan', 9279000 , 'City', 'China'),
(21 , 'Chengdu', 9012000 , 'City (sub-provincial) ', 'China'),
(22 , 'Lima', 8894000 , 'Capital city' , 'Peru'),
(23 , 'Mexico City', 8918653 , 'Capital city', 'Mexico'),
(67, 'Yokohama', 3726167, 'Designated city', 'Japan')--,
--SELECT * FROM @CITYSTATS


SELECT COUNTRY, CITYNAME, SUM(POPULATION) AS NUMBER_OF_PEOPLE
FROM @CITYSTATS
GROUP BY
      GROUPING SETS (( COUNTRY, CITYNAME), (COUNTRY), ())
ORDER BY CASE WHEN COUNTRY IS NULL THEN 1 ELSE 0 END, 1, CASE WHEN CITYNAME IS NULL THEN 1 ELSE 0 END, 3 DESC, 2
