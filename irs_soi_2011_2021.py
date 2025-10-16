import os
import requests

# Define the range of years for which you want to download data.
# For example, for the tax years 2011-2012 through 2021-2022.
START_YEAR = 2011
END_YEAR = 2021

def download_irs_migration_data(start_year, end_year, data_folder="data"):
    """
    Downloads IRS state-to-state migration data for a given range of years.

    Args:
        start_year (int): The first year of the data range (e.g., 2011).
        end_year (int): The last year of the data range (e.g., 2022).
        data_folder (str): The name of the folder to save CSV files.
    """
    print(f"--- Starting IRS Data Scraper for years {start_year}-{end_year} ---")

    # --- 1. Create the data folder if it doesn't exist ---
    if not os.path.exists(data_folder):
        os.makedirs(data_folder)
        print(f"Created directory: '{data_folder}'")

    base_url = "https://www.irs.gov/pub/irs-soi/"
    file_types = ["stateinflow", "stateoutflow"]

    # --- 2. Loop through each year and file type ---
    for year in range(start_year, end_year + 1):
        # Get the last two digits for the file names
        n = year % 100
        n_plus_1 = (year + 1) % 100

        # Format as two-digit strings (e.g., 9 -> "09")
        year_suffix = f"{n:02d}{n_plus_1:02d}"

        for file_type in file_types:
            filename = f"{file_type}{year_suffix}.csv"
            url = f"{base_url}{filename}"
            filepath = os.path.join(data_folder, filename)

            # --- 3. Attempt to download the file ---
            try:
                print(f"Downloading {url}...")
                response = requests.get(url, timeout=15)

                # Check if the file exists on the server (status code 200)
                if response.status_code == 200:
                    with open(filepath, 'wb') as f:
                        f.write(response.content)
                    print(f" -> Successfully saved to '{filepath}'")
                else:
                    print(f" -> File not found (Status: {response.status_code})")

            except requests.exceptions.RequestException as e:
                print(f" -> An error occurred: {e}")
    
    print("\n--- Download process finished. ---")

# --- Main execution block ---
if __name__ == "__main__":
    download_irs_migration_data(START_YEAR, END_YEAR)
