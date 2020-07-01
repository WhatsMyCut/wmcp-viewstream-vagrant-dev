#!/bin/bash
docker cp ./data.dump joby_db:/opt/data.dump
docker exec -i joby_db /bin/bash -c "PGDATABASE=prisma PGHOST=db PGUSER=prisma PGPASSWORD=prisma psql prisma < /opt/data.dump"
