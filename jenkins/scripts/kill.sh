#!/bin/bash
echo "Stopping Flask app in delivery stage..."
kill $(cat flask_pid.txt)
rm flask_pid.txt
