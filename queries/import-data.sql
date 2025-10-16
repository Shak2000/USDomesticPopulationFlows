.mode csv
.import --skip 1 ./fips.csv FIPS

-- 2021-2022 data
.import --skip 1 ./data/stateoutflow2122.csv StateOutflow2122
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

.import --skip 1 ./data/stateinflow2122.csv StateInflow2122
ALTER TABLE StateInflow2122
    ADD COLUMN agi_per_capita INTEGER GENERATED ALWAYS AS (CASE WHEN num_people = 0 THEN 0 ELSE agi / num_people END);

ALTER TABLE StateInflow2122 ADD COLUMN state_dest VARCHAR(2);
ALTER TABLE StateInflow2122 ADD COLUMN state_name_dest VARCHAR(50);

UPDATE StateInflow2122
SET
    state_dest = (SELECT postal_code FROM FIPS WHERE FIPS.fips = StateInflow2122.fips_dest),
    state_name_dest = (SELECT name FROM FIPS WHERE FIPS.fips = StateInflow2122.fips_dest);

UPDATE StateInflow2122
SET state_name_orig = UPPER(state_name_orig);

-- 2020-2021 data
.import --skip 1 ./data/stateoutflow2021.csv StateOutflow2021
ALTER TABLE StateOutflow2021
    ADD COLUMN agi_per_capita INTEGER GENERATED ALWAYS AS (CASE WHEN num_people = 0 THEN 0 ELSE agi / num_people END);

ALTER TABLE StateOutflow2021 ADD COLUMN state_orig VARCHAR(2);
ALTER TABLE StateOutflow2021 ADD COLUMN state_name_orig VARCHAR(50);

UPDATE StateOutflow2021
SET
    state_orig = (SELECT postal_code FROM FIPS WHERE FIPS.fips = StateOutflow2021.fips_orig),
    state_name_orig = (SELECT name FROM FIPS WHERE FIPS.fips = StateOutflow2021.fips_orig);

UPDATE StateOutflow2021
SET state_name_dest = UPPER(state_name_dest);

.import --skip 1 ./data/stateinflow2021.csv StateInflow2021
ALTER TABLE StateInflow2021
    ADD COLUMN agi_per_capita INTEGER GENERATED ALWAYS AS (CASE WHEN num_people = 0 THEN 0 ELSE agi / num_people END);

ALTER TABLE StateInflow2021 ADD COLUMN state_dest VARCHAR(2);
ALTER TABLE StateInflow2021 ADD COLUMN state_name_dest VARCHAR(50);

UPDATE StateInflow2021
SET
    state_dest = (SELECT postal_code FROM FIPS WHERE FIPS.fips = StateInflow2021.fips_dest),
    state_name_dest = (SELECT name FROM FIPS WHERE FIPS.fips = StateInflow2021.fips_dest);

UPDATE StateInflow2021
SET state_name_orig = UPPER(state_name_orig);
