## Function 4: Insert the data into the table
from schema import load_schema
from connection import create_connection


def insert_data():
    schema = load_schema()
    table_name = schema["table_name"]
    columns = [column["name"] for column in schema["columns"]]
    values = [f"%({col})s" for col in columns]
    query = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({', '.join(values)});"
    
    
    conn = create_connection()
    cur = conn.cursor()
    cur.execute(query, {col: val for col, val in zip(columns, values)})
    conn.commit()
    print(f"Data inserted into table '{table_name}' successfully.")
    cur.close()
    conn.close()