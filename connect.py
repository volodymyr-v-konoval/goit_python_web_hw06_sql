from contextlib import contextmanager
import psycopg2


@contextmanager
def create_connection():
    """ create a databese connection to database """
    try:
        conn = psycopg2.connect(host="localhost", 
                               database="hw06", 
                               user="postgres", password="1985"
                               )
        yield conn
        conn.close()
    except psycopg2.OperationalError as err:
        raise RuntimeError(
            f"Failed to create database connection {err}."
            )
    