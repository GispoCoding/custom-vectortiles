# custom-vectortiles

This repository contains docker-compose services for generating vector tiles in custom CRS.
Run the command `docker-compose up` to:

1. Start the backend PostGIS database pre-loaded with some data (`openmaptiles/postgis-preloaded`)
2. Download the Finland OSM extract from Geofabrik and import it to the database with `imposm3` (using `openmaptiles/openmaptiles-tools`)
3. Run the `custom_srid.sql` script to add support for rendering vector tiles in custom projections (WIP)
4. Start [pg_tileserv](https://github.com/CrunchyData/pg_tileserv) to serve the data from PostGIS as vector tiles

The function `custom_srid` can be used to render vector tiles in any CRS using the EPSG ID parameter (defaults to 3857).
Using other coordinate reference systems requires passing a `geometry` parameter to ST_TileEnvelope to define the spatial extent of the initial "zoom level zero".
This is currently not implemented, see the [ST_TileEnvelope](https://postgis.net/docs/ST_TileEnvelope.html) documentation for more details.
