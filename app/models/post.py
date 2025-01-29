from flask import current_app, g
from app.utils.db import get_db

class Post:
    def __init__(self, name, description, price, category):
        self.name = name
        self.description = description
        self.price = price
        self.category = category
        

    def save(self):
        db = get_db()
        cursor = db.cursor()
        cursor.execute(
            "INSERT INTO dish (name, description, price, category_id) VALUES (%s, %s, %s, %s) RETURNING id",
            (self.name, self.description, self.price, self.category)
        )
        post_id = cursor.fetchone()[0]
        db.commit()
        cursor.close()
        return post_id

    @staticmethod
    def get_all():
        db = get_db()
        cursor = db.cursor()
        cursor.execute("SELECT d.name, d.description, d.price, c.name FROM dish AS d JOIN category as c ON d.category_id = c.id")
        posts = cursor.fetchall()
        print(posts)
        cursor.close()
        return posts
        #return [{'name': row[1], 'description': row[2], 'price': row[3], 'category': [4]} for row in posts]

