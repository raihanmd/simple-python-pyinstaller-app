#!/bin/bash
echo "Starting Flask app for testing in delivery stage..."
source venv/bin/activate
python app.py &
FLASK_PID=$!
echo $FLASK_PID > flask_pid.txt
