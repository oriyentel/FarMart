--The query below returns the closest 20 locations that are within a radius of 100 miles to a given coordinate
-- need to define constants for latpoint and longpoint based upon user query (do in PHP)
-- need to get find a way to take ZIP to a coordinate
-- more at http://www.plumislandmedia.net/mysql/haversine-mysql-nearest-loc/
WITH calcs AS(
SELECT fmid, marketname,
      69* DEGREES(ACOS(COS(RADIANS(latpoint))
                 * COS(RADIANS(latitude))
                 * COS(RADIANS(longpoint) - RADIANS(longitude))
                 + SIN(RADIANS(latpoint))
                 * SIN(RADIANS(latitude)))) AS distance_in_miles
 FROM farmmarkets)

 SELECT marketname, distance_in_miles
 FROM calcs
 WHERE distance_in_miles < 100
 ORDER BY distance_in_miles ASC
 LIMIT 15;



 