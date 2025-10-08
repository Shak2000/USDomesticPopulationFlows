SELECT state_name_orig, state_name_dest, num_people, agi_per_capita
  FROM StateOutflow2122
  WHERE (state_orig = "CA" AND state_dest = "TX")
      OR (state_orig = "TX" AND state_dest = "CA");
