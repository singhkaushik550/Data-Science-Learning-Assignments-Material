from connection import create_connection
from schema import load_schema

def insert_data(data):
    schema = load_schema()

    table_name = schema["table_name"]

    columns = [column["name"] for column in schema["columns"]]

    placeholders = ", ".join([f"%({col})s" for col in columns])

    query = f"""
    INSERT INTO {table_name}
    ({", ".join(columns)})
    VALUES
    ({placeholders});
    """

    conn = create_connection()
    cur = conn.cursor()

    cur.execute(query, data)

    conn.commit()

    cur.close()
    conn.close()    