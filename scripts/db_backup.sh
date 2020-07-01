#!/bin/bash
docker exec -i joby_db /bin/bash -c "PGDATABASE=prisma PGHOST=db PGUSER=prisma PGPASSWORD=prisma pg_dump > /opt/data.dump"
docker cp joby_db:/opt/data.dump ./data.dump
