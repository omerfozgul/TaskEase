from app import app, db
from models import TodoItem
from schemas import todo_schema, todos_schema
from flask import request, jsonify

@app.route('/todo', methods=['POST'])
def add_todo():
    print('post triggered')
    name = request.json['name']
    is_executed = request.json['is_executed']

    new_todo_item = TodoItem(name, is_executed)
    db.session.add(new_todo_item)
    db.session.commit()

    return todo_schema.jsonify(new_todo_item)

@app.route('/todo', methods=['GET'])
def get_todos():
    all_todos = TodoItem.query.all()
    result = todos_schema.dump(all_todos)

    return jsonify(result)

@app.route('/todo/<id>', methods=['PUT', 'PATCH'])
def execute_todo(id):
    todo = TodoItem.query.get(id)

    todo.is_executed = not todo.is_executed
    db.session.commit()

    return todo_schema.jsonify(todo)

@app.route('/todo/<id>', methods=['DELETE'])
def delete_todo(id):
    todo_to_delete = TodoItem.query.get(id)
    db.session.delete(todo_to_delete)
    db.session.commit()

    return todo_schema.jsonify(todo_to_delete)
