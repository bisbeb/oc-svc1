from flask import Flask
from flask import jsonify
import socket
 
app = Flask(__name__)
 
@app.route('/')
def index():
  body = {}
  body['msg'] = "SVC1: Hello World"
  body['hostname'] = socket.gethostname()
  return jsonify(body)
