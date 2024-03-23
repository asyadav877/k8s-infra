import os
import logging
from flask import Flask, request, jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)

# Configure logger
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

mysql = None

# Health Check API
@app.route('/healthcheck', methods=['GET'])
def health_check():
    logger.info('Health check request received')
    return jsonify({'status': 'ok'})

# Create User API
@app.route('/users', methods=['POST'])
def create_user():
    data = request.json
    name = data.get('name')
    email = data.get('email')
    cursor = mysql.connection.cursor()
    cursor.execute('INSERT INTO users (name, email) VALUES (%s, %s)', (name, email))
    mysql.connection.commit()
    cursor.close()
    logger.info('User created: %s', name)
    return jsonify({'message': 'User created successfully'})

# Update User API
@app.route('/users/<int:user_id>', methods=['PUT'])
def update_user(user_id):
    data = request.json
    name = data.get('name')
    email = data.get('email')
    cursor = mysql.connection.cursor()
    cursor.execute('UPDATE users SET name = %s, email = %s WHERE id = %s', (name, email, user_id))
    mysql.connection.commit()
    cursor.close()
    logger.info('User updated: %s', name)
    return jsonify({'message': 'User updated successfully'})

# Delete User API
@app.route('/users/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    cursor = mysql.connection.cursor()
    cursor.execute('DELETE FROM users WHERE id = %s', (user_id,))
    mysql.connection.commit()
    cursor.close()
    logger.info('User deleted: %s', user_id)
    return jsonify({'message': 'User deleted successfully'})

# Get User API
@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM users WHERE id = %s', (user_id,))
    user = cursor.fetchone()
    cursor.close()
    if user:
        logger.info('User retrieved: %s', user_id)
        return jsonify({'id': user[0], 'name': user[1], 'email': user[2]})
    else:
        logger.warning('User not found: %s', user_id)
        return jsonify({'message': 'User not found'}), 404

# Interrupt API
@app.route('/interrupt', methods=['GET'])
def interrupt():
    logger.warning('Interrupt request received')
    # Perform some long-running operation or raise an exception to simulate an interruption
    return jsonify({'message': 'Interrupted'})

if __name__ == '__main__':
    # MySQL configurations
    db_host = os.getenv('DB_HOSTNAME', 'localhost')
    db_port = os.getenv('DB_PORT', '3306')
    db_name = os.getenv('DB_NAME', 'usermgmt')
    db_user = os.getenv('DB_USERNAME', 'root')
    db_password = os.getenv('DB_PASSWORD', 'dbpassword11')

    app.config['MYSQL_HOST'] = db_host
    app.config['MYSQL_PORT'] = int(db_port)
    app.config['MYSQL_USER'] = db_user
    app.config['MYSQL_PASSWORD'] = db_password
    app.config['MYSQL_DB'] = db_name

    mysql = MySQL(app)
    app.run(host='0.0.0.0', debug=True)