import logging

from faker import Faker
import random
import psycopg2
from psycopg2 import DatabaseError

from connect import create_connection

fake = Faker()

try:
    with create_connection() as conn:
        cur = conn.cursor()

        for _ in range(3):
            cur.execute("INSERT INTO groups (name) VALUES (%s)", (fake.unique.word(),))
            
        for _ in range(5):
            cur.execute("INSERT INTO teachers (fullname) VALUES (%s)",
                        (fake.name(),))
                        
        for teacher_id in range(1, 6):
            for _ in range(2):
                cur.execute("INSERT INTO subjects (name, teacher_id) VALUES (%s, %s)",
                            (fake.unique.job(), teacher_id))

        for group_id in range(1, 4):
            for _ in range(10):
                cur.execute("INSERT INTO students (name, group_id) VALUES (%s, %s) RETURNING id",
                            (fake.name(), group_id))
                student_id = cur.fetchone()[0]
                for subject_id in range(1, 11):
                    for _ in range(5):
                        cur.execute("INSERT INTO grades (student_id, subject_id, grade, grade_date) VALUES (%s, %s, %s, %s)",
                                    (student_id, subject_id, random.randint(0, 100), 
                                     fake.date_this_decade()))
        
        conn.commit()
except DatabaseError as e:
    logging.error(e)
    conn.rollback()
finally:
    if cur:
        cur.close()
