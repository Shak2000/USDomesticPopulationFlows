SELECT s1.state_name_orig, s1.state_name_dest, s1.num_people, s1.agi_per_capita, s2.state_name_orig, s2.state_name_dest, s2.num_people, s2.agi_per_capita
  FROM StateOutflow2122 AS s1, StateInflow2122 AS s2
 WHERE s1.state_orig = "CA"
        AND s2.state_dest = "CA"
        AND s1.state_name_orig = s2.state_name_dest
        AND s1.state_name_dest = s2.state_name_orig;
