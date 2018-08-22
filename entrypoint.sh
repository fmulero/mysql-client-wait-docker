#!/bin/sh -x
SQL="$@"
/opt/mysql-client/wait-for-it.sh ${DB_HOST}:${DB_PORT} --timeout=30

mysql --user=$DB_USER --password=$DB_PASSWORD --host=$DB_HOST --port=$DB_PORT --database=$DB_NAME -v --execute="$SQL"
