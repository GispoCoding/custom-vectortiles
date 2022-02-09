#!/usr/bin/env bash

set -e

docker run -it --net=maptiles_default -p "8090:8090" --rm --env-file .env -v "${PWD}/openmaptiles/layers/place:/layer" -v "${PWD}/tileset.yaml:/tileset/tileset.yaml" openmaptiles/openmaptiles-tools bash
# run generate-sql tileset.yaml && postserve tileset.yaml

