#!/usr/bin/env bash

set -e

docker run --net=maptiles_default -it --rm --env-file .env -v "${PWD}/openmaptiles/layers/place:/mapping" -v "${PWD}/data:/import" openmaptiles/openmaptiles-tools import-osm
