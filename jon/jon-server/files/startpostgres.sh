sysctl -p
su postgres -c 'pg_ctl start -D /opt/rh/postgresql92/root/var/lib/pgsql/data -s -o "-p 5432" -w -t 300'

