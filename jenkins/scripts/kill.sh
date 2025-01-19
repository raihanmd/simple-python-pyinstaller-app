#!/usr/bin/env sh

echo "Stopping Flask app in delivery stage..."
set -x
kill $(cat flask_pid.txt)
rm flask_pid.txt
