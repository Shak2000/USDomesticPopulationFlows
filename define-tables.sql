CREATE TABLE FIPS (
    fips INTEGER PRIMARY KEY,
    name VARCHAR(50),
    postal_code VARCHAR(2)
);

CREATE TABLE StateOutflow2122 (
    fips_orig INTEGER,
    fips_dest INTEGER,
    state_dest VARCHAR(2),
    state_name_dest VARCHAR(50),
    num_returns INTEGER,
    num_people INTEGER,
    agi INTEGER,
    PRIMARY KEY (fips_orig, state_name_dest)
);

CREATE TABLE StateOutflow2021 (
    fips_orig INTEGER,
    fips_dest INTEGER,
    state_dest VARCHAR(2),
    state_name_dest VARCHAR(50),
    num_returns INTEGER,
    num_people INTEGER,
    agi INTEGER,
    PRIMARY KEY (fips_orig, state_name_dest)
);
