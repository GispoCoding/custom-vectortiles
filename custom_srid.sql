CREATE OR REPLACE
FUNCTION public.customsrid(
            z integer, x integer, y integer,
            srid integer default 3857)
RETURNS bytea
AS $$
DECLARE
    result bytea;
BEGIN
    WITH
    -- ST_TileEnvelope has an optional geometry parameter for custom projections
    -- Pass a geometry with the SRID and extent of inital zoom level 0
    -- These geometries can be stored in the database for each supported SRID
    bounds AS (
      SELECT ST_TileEnvelope(z, x, y) AS geom
    ),
    mvtgeom AS (
      SELECT ST_AsMVTGeom(ST_Transform(t.geometry, srid), bounds.geom) AS geom,
        t.name, t.name_en
      FROM osm_poi_polygon t, bounds
      WHERE ST_Intersects(t.geometry, bounds.geom)
    )

    SELECT ST_AsMVT(mvtgeom, 'public.customsrid')
    INTO result
    FROM mvtgeom;

    RETURN result;
END;
$$
LANGUAGE 'plpgsql'
STABLE
PARALLEL SAFE;
