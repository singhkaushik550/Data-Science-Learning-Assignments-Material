## Function 3: Create the table with the dynamic way
from connection import create_connection
from schema import load_schema
def create_table():
    schema = load_schema()

    table_name = schema["table_name"]

    columns = []

    for column in schema["columns"]:
        col = f'{column["name"]} {column["type"]}'
        columns.append(col.strip())

    query = f"""
    CREATE TABLE IF NOT EXISTS {table_name}
    (
        {", ".join(columns)}
    );
    """

    conn = create_connection()
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    print(f"Table '{table_name}' created successfully.")
    cur.close()