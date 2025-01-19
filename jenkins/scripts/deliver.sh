#!/usr/bin/env sh

echo "Starting Flask app for testing in delivery stage..."
set -x
python3 app.py &
FLASK_PID=$!
echo $FLASK_PID > flask_pid.txt
set +x
