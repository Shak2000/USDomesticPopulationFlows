.mode csv
.import --skip 1 fips.csv FIPS

.import --skip 1 stateoutflow2122.csv StateOutflow2122
ALTER TABLE StateOutflow2122
    ADD COLUMN agi_per_capita INTEGER GENERATED ALWAYS AS (CASE WHEN num_people = 0 THEN 0 ELSE agi / num_people END);

ALTER TABLE StateOutflow2122 ADD COLUMN state_orig VARCHAR(2);
ALTER TABLE StateOutflow2122 ADD COLUMN state_name_orig VARCHAR(50);

UPDATE StateOutflow2122
SET
    state_orig = (SELECT postal_code FROM FIPS WHERE FIPS.fips = StateOutflow2122.fips_orig),
    state_name_orig = (SELECT name FROM FIPS WHERE FIPS.fips = StateOutflow2122.fips_orig);

UPDATE StateOutflow2122
SET state_name_dest = UPPER(state_name_dest);
