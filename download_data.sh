#!/usr/bin/env bash

set -e

docker run -it --rm -v "${PWD}/data:/tileset" openmaptiles/openmaptiles-tools download-osm geofabrik finland

