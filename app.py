#!/usr/bin/env python
from flask import Flask, render_template
from flask_socketio import SocketIO

import logging
logging.basicConfig(filename='quickstart.log', level=logging.INFO)


async_mode = None

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app, async_mode=async_mode)




@app.route('/')
def index():
    return render_template('index.html', async_mode=socketio.async_mode)


lab_completed = []
connection_count = 0

@app.route('/ping/<postID>')
def ping(postID):
    global lab_completed
    logging.info('Completed lab: {}'.format_map(postID))
    lab_completed.append(postID)
    _update_lab_detail()

    return render_template('ping.html')

@app.route('/lab')
def lab_monitor():
    return render_template('lab_monitor.html')


@socketio.on('connect', namespace='/quickstart')
def update_connection():
    global connection_count
    connection_count += 1
    _update_connection()
    _update_lab_detail()


@socketio.on('connect', namespace='/quickstartlab')
def show_connection():
    _update_connection()
    _update_lab_detail()


def _update_connection():
    global connection_count

    socketio.emit('update_connection',
                  {'count': connection_count},
                  namespace='/quickstart')
    socketio.emit('update_connection',
                  {'count': connection_count},
                  namespace='/quickstartlab')


def _update_lab_detail():
    global lab_completed
    socketio.emit('update_lab',
                  {'data': lab_completed},
                  namespace='/quickstartlab')
    socketio.emit('update_lab',
                  {'data': lab_completed},
                  namespace='/quickstart')


if __name__ == '__main__':
    socketio.run(app, debug=True)
