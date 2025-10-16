# U.S. Domestic Population Flows Analysis

This repository contains a comprehensive dataset and analysis tools for studying domestic population movements between U.S. states. The data tracks state-to-state migration patterns, including the number of people moving and their associated Adjusted Gross Income (AGI).

## File Setup

The repository contains several key data files. The project uses SQLite for data storage and analysis. The components are arranged as follows:

- `data.db`: SQLite database containing the migration data
- `fips.csv`: Federal Information Processing Standard (FIPS) codes for U.S. states
- `irs_soi_2011_2022.py`: Scrape Statistics of Income (SOI) data from the IRS's website covering 2011-2012 through 2021-2022
- `manage_db.sh`: Shell script for database management
- `queries/`: Directory containing SQL queries for data analysis:
  - `define-tables.sql`: Database schema definition
  - `delete-tables.sql`: Table cleanup queries
  - `import-data.sql`: Data import statements
  - `state-inflow-outflow.sql`: Analysis of state-level migration patterns
  - `state-outflow-inflow.sql`: Comparative analysis of population flows
  - `two-state-inflow.sql`: Analysis of migration between specific state pairs
  - `two-state-outflow.sql`: Analysis of outbound migration patterns
- `data/`: Directory containing the data loaded into the database
  - `stateinflow2122.csv`: Records of population inflows to each state for 2021-2022
  - `stateoutflow2122.csv`: Records of population outflows to each state for 2021-2022
  - Similarly named `.csv` files for both inflows and outflows covering 2011-2012 through 2020-2021.

## Getting Started

1. Ensure you have SQLite installed on your system
2. Make the database setup script executable:
    ```bash
    chmod +x manage_db.sh
    ```
3. Run the database setup script:
    ```bash
    ./manage_db.sh create
    ```
The script will:
   - Create the necessary database tables
   - Import the CSV data files
   - Set up the required indexes
4. To clean up the database, run this script:
    ```bash
    ./manage_db.sh delete
    ```

## Data Analysis

The provided SQL queries allow you to analyze:
- Net migration patterns between states
- AGI flows associated with population movement
- Year-over-year migration trends
- State-specific inflow and outflow patterns

## Data Sources

The migration data is sourced from IRS Statistics of Income (SOI) migration data, which tracks year-to-year address changes reported on individual income tax returns filed with the IRS.
