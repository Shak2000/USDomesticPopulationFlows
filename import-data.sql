.mode csv
.import --skip 1 stateoutflow2122.csv StateOutflow2122
ALTER TABLE StateOutflow2122
    ADD COLUMN agi_per_capita INTEGER GENERATED ALWAYS AS (CASE WHEN num_people = 0 THEN 0 ELSE agi / num_people END);
