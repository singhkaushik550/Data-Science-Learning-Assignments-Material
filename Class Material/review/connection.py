
import psycopg2

def create_connection():
    conn = psycopg2.connect(
        host="localhost",
        database="postgres",
        user="postgres",
        password="12345678",
        port="5432"
    )
    return conn