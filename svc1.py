from flask import Flask
from flask import Response
import json

app = Flask(__name__)

@app.route('/api/svc1', methods=['GET'])
def api_svc1():
    data = {
            'Schweiz':'Bern',
            'Deutschland':'Berlin',
            'Frankreich':'Paris',
            'Spanien':'Madrid',
            'Griechenland':'Athen',
            'Russland':'Moskau',
            'Mexiko':'Mexico City',
            'Costa Rica':'San Jose',
            'USA':'Washington DC',
            'England':'London',
            'Japan':'Tokyo',
            'China':'Bejing',
            'Thailand':'Bangkok',
            'Italien':'Rom',
    }
    js = json.dumps(data)
    resp = Response(js, status=200, mimetype='application/json')
    return resp

if __name__ == "__main__":
    app.run(host='0.0.0.0')

