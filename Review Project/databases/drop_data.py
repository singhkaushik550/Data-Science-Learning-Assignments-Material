### Drop table function
from connection import create_connection
from schema import load_schema

def drop_table():
    schema = load_schema()
    table_name = schema["table_name"]
    
    conn = create_connection()
    cur = conn.cursor()

    query = f"DROP TABLE {table_name};"

    cur.execute(query)
    conn.commit()

    print("Table dropped successfully.")

    cur.close()
    conn.close()