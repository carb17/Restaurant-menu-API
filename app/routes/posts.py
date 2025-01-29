import logging
from flask import Blueprint, request, jsonify
from app.models.post import Post

logging.basicConfig(level=logging.ERROR, format='%(asctime)s %(levelname)s: %(message)s')

bp = Blueprint('posts', __name__, url_prefix='/posts')

@bp.route('/create', methods=['POST'])
def create():
    try:
        name = request.json['name']
        description = request.json['description']
        price = request.json['price']
        category = request.json['category']

        post = Post(name, description, price, category)

        post_id = post.save()

        return jsonify({'message': 'Post created successfully!', 'id': str(post_id)}), 201
    except KeyError as e:
        return jsonify({'error': f'The field is missing {e}'}), 400
    except Exception as e:
        logging.error('Error creating post.', exc_info=True)
        return jsonify({'error': 'Error creating post'}), 500

@bp.route('/list', methods=['GET'])
def list():
    try:
        posts = Post.get_all()

        posts_json = [{'name': row[0], 'description': row[1], 'price': row[2], 'category': row[3]} for row in posts]

        return jsonify(posts_json), 200
    except Exception as e:
        logging.error('Error listing posts.', exc_info=True)
        return jsonify({'error': 'Error listing posts.'}), 500
