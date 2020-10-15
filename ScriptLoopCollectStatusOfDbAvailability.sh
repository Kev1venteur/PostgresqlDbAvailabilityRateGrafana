#!/bin/bash
while true; do
  #Requete simple dans la base postgresql
  psql postgresql://<user>:<password>@<host>:<port>/<db> --command="SELECT version();"
  if [ $? -eq 0 ]; then
    echo "The database is up"
    #Si la requête précédente n'échoue pas alors on écrit un up dans influxdb
    #Pour ajouter des données dans la base influxdb il faut faire un curl (voir la doc)
    curl -XPOST http://<dbhost>:8086/write?db=mydb --data-binary "taux_dispo current_status=up"
  else
    echo "The database is down"
    #Si la requète échoue alors on écrit un down dans influxdb
    curl -XPOST http://<dbhost>:8086/write?db=mydb --data-binary "taux_dispo current_status=down"
  fi
  #On attends une minute entre chaques itération
  sleep 1m
done
