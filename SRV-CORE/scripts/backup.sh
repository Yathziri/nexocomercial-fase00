#!/bin/bash
mysqldump -u root -p tienda > /tmp/respaldo.sql
echo "Respaldo completado en /tmp/respaldo.sql"
