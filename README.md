# latlon_grid

Reference grid to be used in all the climate services. Repository contents:

* 'data':
  * 'netcdf': the grids for the two spatial domains (pen_wgs84.nc and can_wgs84.nc, for peninsular Spain and the Canary Islands), in netCDF format.
  * 'shp': the grids for the two spatial domains (pen.shp and can.shp, for peninsular Spain and the Canary Islands), in ArcGIS shapefile format.
  * 'tif': the grids for the two spatial domains (pen_grid.tif and can_grid.tif, for peninsular Spain and the Canary Islands), in geoTIFF format; and some auxiliary files: a sea / land mask, the elevation, and distance to the sea.
* 'R': R scripts to generate the reference grid in netCDF format (latlon_pen_wgs84.R and latlon_can_wgs84.R, for peninsular Spain and the Canary Islands).

These are the characteristics of the mainland Spain grid:

* dimensions:
    lon = 620;
    lat = 375;
    time = UNLIMITED;
* spatial resolution: 0.025;
* origin:
    lon = -10.3;
    lat = 43;
    time = 1;
* double lon(lon=620);
  :units = "degrees_east";
  :long_name = "longitude";
  :standard_name = "longitude";
  :axis = "X";
  :comment = "Longitude geographical coordinates, WGS84 projection";
  :reference_datum = "geographical coordinates, WGS84 projection";
* double lat(lat=375);
  :units = "degrees_north";
  :long_name = "latitude";
  :standard_name = "latitude";
  :axis = "Y";
  :comment = "Latitude geographical coordinates, WGS84 projection";
  :reference_datum = "geographical coordinates, WGS84 projection";
* double time(time=1);
      :units = "days since 1900-01-01";
      :long_name = "time";
      :calendar = "gregorian";
      :axis = "T";
* int crs;
  :long_name = "CRS definition";
  :grid_mapping_name = "latitude_longitude";
  :longitude_of_prime_meridian = 0; // int
  :semi_major_axis = 6378137; // int
  :inverse_flattening = 298.257223563; // double
  :crs_wkt = "GEOGCRS[\"WGS 84\", ENSEMBLE[\"World Geodetic System 1984 ensemble\",\n
  
These are the characteristics of the Canary Islands grid:

* dimensions:
    lon = 212;
    lat = 84;
    time = UNLIMITED
* spatial resolution: 0.025;
* origin:
    lon = -18.425;
    lat = 29.525;
    time = 1;
* double lon(lon=212);
  :units = "degrees_east";
  :long_name = "longitude";
  :standard_name = "longitude";
  :axis = "X";
  :comment = "Longitude geographical coordinates, WGS84 projection";
  :reference_datum = "geographical coordinates, WGS84 projection";
* double lat(lat=84);
  :units = "degrees_north";
  :long_name = "latitude";
  :standard_name = "latitude";
  :axis = "Y";
  :comment = "Latitude geographical coordinates, WGS84 projection";
  :reference_datum = "geographical coordinates, WGS84 projection";
* double time(time=1);
      :units = "days since 1900-01-01";
      :long_name = "time";
      :calendar = "gregorian";
      :axis = "T";
* int crs;
  :long_name = "CRS definition";
  :grid_mapping_name = "latitude_longitude";
  :longitude_of_prime_meridian = 0; // int
  :semi_major_axis = 6378137; // int
  :inverse_flattening = 298.257223563; // double
  :crs_wkt = "GEOGCRS[\"WGS 84\", ENSEMBLE[\"World Geodetic System 1984 ensemble\",\n
  
