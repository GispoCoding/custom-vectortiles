#!/usr/bin/env bash

if [ ! -f /import/*.pbf ]; then
  download-osm geofabrik finland
  mv ./*.pbf /import/
fi

for layer in openmaptiles/layers/*; do
  echo "Importing $layer"
  export IMPOSM_MAPPING_FILE="$(pwd)/$layer/mapping.yaml"
  import-osm
done

psql -f custom_srid.sql
