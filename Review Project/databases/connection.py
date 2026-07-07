
import psycopg2
from dotenv import load_dotenv
import os

load_dotenv()

def create_connection():
    conn = psycopg2.connect(
        host=os.getenv("host"),
        database=os.getenv("database"),
        user=os.getenv("user"),
        password=os.getenv("password"),
        port=os.getenv("port")
    )
    return conn