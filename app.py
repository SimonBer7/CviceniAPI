from flask import Flask, request, jsonify, render_template
from flask_mysqldb import MySQL
from dotenv import load_dotenv
from functools import wraps
import os


app = Flask(__name__)

load_dotenv()

app.config['MYSQL_DB'] = 'blog'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'

mysql = MySQL(app)

def is_authorized(token):
    if token == os.getenv('AUTH_TOKEN'):
        return True
    else:
        return False
    
    

def find_blog_post(blog_id):
    if not is_authorized(request.headers.get('Authorization')):
        return jsonify({"error": "Not authorized"}), 403
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM blog_posts WHERE post_id = %s", (blog_id,))
    blog_post = cursor.fetchone()
    cursor.close()
    return blog_post

@app.route('/')
def index():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM blog_posts")
    blog_posts = cursor.fetchall()
    cursor.close()
    return render_template('index.html', blog_posts=blog_posts)

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/signup')
def signup():
    return render_template('signup.html')

@app.route('/api/blog', methods=['POST'])
def create_blog_post():
    if not is_authorized(request.headers.get('Authorization')):
        return jsonify({"error": "Not authorized"}), 403
    data = request.json
    title = data['title']
    content = data['content']
    author_id = data['author_id']

    cursor = mysql.connection.cursor()
    cursor.execute("INSERT INTO blog_posts (title, content, author_id) VALUES (%s, %s, %s)",
                   (title, content, author_id))
    mysql.connection.commit()
    cursor.close()

    return jsonify({"message": "Blog post created successfully"}), 201


@app.route('/api/blog', methods=['GET'])
def get_all_blog_posts():
    if not is_authorized(request.headers.get('Authorization')):
        return jsonify({"error": "Not authorized"}), 403
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM blog_posts")
    blog_posts = cursor.fetchall()
    cursor.close()
    return jsonify(blog_posts)


@app.route('/api/blog/<int:blog_id>', methods=['GET'])
def get_blog_post(blog_id):
    if not is_authorized(request.headers.get('Authorization')):
        return jsonify({"error": "Not authorized"}), 403
    blog_post = find_blog_post(blog_id)
    if blog_post:
        return jsonify(blog_post)
    else:
        return jsonify({"error": "Blog post not found"}), 404


@app.route('/api/blog/<int:blog_id>', methods=['DELETE'])
def delete_blog_post(blog_id):
    if not is_authorized(request.headers.get('Authorization')):
        return jsonify({"error": "Not authorized"}), 403
    blog_post = find_blog_post(blog_id)
    if blog_post:
        cursor = mysql.connection.cursor()
        cursor.execute("DELETE FROM blog_posts WHERE post_id = %s", (blog_id,))
        mysql.connection.commit()
        cursor.close()
        return jsonify({"message": "Blog post deleted successfully"})
    else:
        return jsonify({"error": "Blog post not found"}), 404


@app.route('/api/blog/<int:blog_id>', methods=['PATCH'])
def update_blog_post(blog_id):
    if not is_authorized(request.headers.get('Authorization')):
        return jsonify({"error": "Not authorized"}), 403
    blog_post = find_blog_post(blog_id)
    if blog_post:
        data = request.json
        title = data.get('title', blog_post['title'])
        content = data.get('content', blog_post['content'])

        cursor = mysql.connection.cursor()
        cursor.execute("UPDATE blog_posts SET title = %s, content = %s WHERE post_id = %s",
                       (title, content, blog_id))
        mysql.connection.commit()
        cursor.close()

        return jsonify({"message": "Blog post updated successfully"})
    else:
        return jsonify({"error": "Blog post not found"}), 404

@app.errorhandler(404)
def page_not_found(e):
    return ({"error": "Page not found"}), 404


if __name__ == '__main__':
    app.run(debug=True)