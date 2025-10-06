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
