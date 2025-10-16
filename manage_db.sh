#!/bin/bash
DB_FILE="data.db"
CREATE_SQL="./queries/define-tables.sql"
IMPORT_SQL="./queries/import-data.sql"
DELETE_SQL="./queries/delete-tables.sql"

ACTION=$1
case "$ACTION" in
  create)
    echo "▶️  Creating database: $DB_FILE..."
    sqlite3 "$DB_FILE" < "$CREATE_SQL"
    sqlite3 "$DB_FILE" < "$IMPORT_SQL"
    echo "✅ Database created successfully."
    python irs_soi_2011_2022.py
    echo "✅ Data files imported successfully."
    ;;

  delete)
    echo "▶️ Deleting database: $DB_FILE..."
    sqlite3 "$DB_FILE" < "$DELETE_SQL"
    echo "🗑️ Data tables deleted."
    rm -rf data
    ;;

  *)
    echo "❗️ Error: Invalid or missing action."
    echo "Usage: $0 {create|delete}"
    exit 1
    ;;
esac

exit 0
