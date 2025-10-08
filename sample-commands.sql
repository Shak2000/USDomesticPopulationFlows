-- SELECT state_name_orig, state_name_dest, num_people, agi_per_capita
--   FROM StateOutflow2122
--  WHERE (state_orig = "CA" AND state_dest = "TX")
--          OR (state_orig = "TX" AND state_dest = "CA");

SELECT s1.state_name_orig, s1.state_name_dest, s1.num_people, s1.agi_per_capita, s2.state_name_orig, s2.state_name_dest, s2.num_people, s2.agi_per_capita
  FROM StateOutflow2122 AS s1, StateOutflow2122 AS s2
 WHERE s1.state_orig = "CA"
        AND s2.state_dest = "CA"
        AND s1.state_dest = s2.state_orig
        AND s1.fips_orig < 57
        AND s1.fips_dest < 57
        AND s1.state_name_dest NOT LIKE '%MIGRANTS%';
