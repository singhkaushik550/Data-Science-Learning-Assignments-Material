# Function 2: Create Database
from connection import create_connection
def create_database(db_name):
    conn = create_connection()
    conn.autocommit = True

    cur = conn.cursor()

    query = f"CREATE DATABASE {db_name};"

    try:
        cur.execute(query)
        print(f"Database '{db_name}' created successfully.")
    except Exception as e:
        print("Error:", e)

    cur.close()
    conn.close()