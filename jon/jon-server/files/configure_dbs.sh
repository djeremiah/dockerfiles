#!/bin/bash

# Start postgres
service postgresql92-postgresql start

# Configure dbs
su postgres -c "psql<<EOF
ALTER USER postgres PASSWORD 'dbadmin1!';
CREATE USER rhqadmin PASSWORD 'rhqadmin';
CREATE DATABASE rhq OWNER rhqadmin;
EOF"

# Stop postgres
service postgresql92-postgresql stop
