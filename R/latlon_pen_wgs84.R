# script to create a netcdf with random values and assign it a lambert conformal conic crs. 
# Load the necessary libraries
library(ncdf4)
library(rgdal)

dir<- 'E:/IPE/NetCDF_project/latlon_grid/data'
setwd(dir)

nc_name<- "pen_wgs84.nc"

# Define dimensions
grid_size  <- 0.025

# Define dimensions (modified to exclude the first row and column of pixels)
dimLon <- ncdf4::ncdim_def(name = "lon", 
                    units = "degrees_east", 
                    vals = seq(-10.275 - (grid_size/2),
                               5.2,
                               by = grid_size),
                    longname = 'longitude')

dimLat <- ncdf4::ncdim_def(name = "lat", 
                    units = "degrees_north", 
                    vals = seq(34.6 + (grid_size/2),
                               43.975,
                               by = grid_size),
                    longname = "latitude")

dimTime <- ncdf4::ncdim_def(name = "time", 
                     units = "days since 1900-01-01", 
                     vals = seq(0, 0, by = 1), 
                     unlim = TRUE,
                     calendar = "gregorian",
                     longname = "time")

# Define the CRS variable
varCRS <- ncdf4::ncvar_def(name = "crs", 
                    units = "", 
                    dim = list(), 
                    longname = "CRS definition", 
                    prec = "integer")


# Define the temperature variable
varDummy <- ncdf4::ncvar_def(name = "Dummy", 
                     units = "-", 
                     dim = list(dimLon, dimLat, dimTime), 
                     longname = "A dummy variable", 
                     prec = "single", 
                     missval = -99999)

# Create a new netCDF file and add the variables
nc <- ncdf4::nc_create(nc_name, vars = list(varDummy,varCRS))

# Link the dummy variable to the projection variable using the 
# grid_mapping attribute
ncdf4::ncatt_put(nc, "Dummy", "grid_mapping", "crs")

# CRS attributes
ncdf4::ncatt_put(nc, 'crs', 'grid_mapping_name', 'latitude_longitude')
ncdf4::ncatt_put(nc, 'crs', 'longitude_of_prime_meridian', 0.0)
ncdf4::ncatt_put(nc, 'crs', 'semi_major_axis', 6378137.0)
ncdf4::ncatt_put(nc, 'crs', 'inverse_flattening', 298.257223563)
ncdf4::ncatt_put(nc, 'crs', 'crs_wkt', 'GEOGCRS["WGS 84", ENSEMBLE["World Geodetic System 1984 ensemble",
                 MEMBER["World Geodetic System 1984 (Transit)"],
                 MEMBER["World Geodetic System 1984 (G730)"],
                 MEMBER["World Geodetic System 1984 (G873)"],
                 MEMBER["World Geodetic System 1984 (G1150)"],
                 MEMBER["World Geodetic System 1984 (G1674)"],
                 MEMBER["World Geodetic System 1984 (G1762)"],
                 MEMBER["World Geodetic System 1984 (G2139)"],
                 ELLIPSOID["WGS 84",6378137,298.257223563,
                           LENGTHUNIT["metre",1]],
                 ENSEMBLEACCURACY[2.0]],
        PRIMEM["Greenwich",0,
               ANGLEUNIT["degree",0.0174532925199433]],
        CS[ellipsoidal,2],
        AXIS["geodetic latitude (Lat)",north,
             ORDER[1],
             ANGLEUNIT["degree",0.0174532925199433]],
        AXIS["geodetic longitude (Lon)",east,
             ORDER[2],
             ANGLEUNIT["degree",0.0174532925199433]],
        USAGE[
          SCOPE["Horizontal component of 3D system."],
          AREA["World."],
          BBOX[-90,-180,90,180]],
        ID["EPSG",4326]]')

# Add longitude attributes
ncdf4::ncatt_put(nc, 'lon', 'long_name', 'longitude')
ncdf4::ncatt_put(nc, 'lon', 'standard_name', 'longitude')
ncdf4::ncatt_put(nc, 'lon', 'axis', 'X')
ncdf4::ncatt_put(nc, 'lon', 'comment', 'Longitude geographical coordinates, WGS84 projection')
ncdf4::ncatt_put(nc, 'lon', 'reference_datum', 'geographical coordinates, WGS84 projection')

# Add latitude attributes
ncdf4::ncatt_put(nc, 'lat', 'long_name', 'latitude')
ncdf4::ncatt_put(nc, 'lat', 'standard_name', 'latitude')
ncdf4::ncatt_put(nc, 'lat', 'axis', 'Y')
ncdf4::ncatt_put(nc, 'lat', 'comment', 'Latitude geographical coordinates, WGS84 projection')
ncdf4::ncatt_put(nc, 'lat', 'reference_datum', 'geographical coordinates, WGS84 projection')

# Add time attributes
ncdf4::ncatt_put(nc,"time", "axis", "T")

# Add dummy attributes
ncdf4::ncatt_put(nc, "Dummy", "standard_name", "A random value")

# Add global attributes
ncdf4::ncatt_put(nc,0, "Conventions", "CF-1.8")

# Generate some data to fill the dummy variable
data <- array(stats::runif(length(dimLon$vals) * length(dimLat$vals) * length(dimTime$vals)), 
              c(length(dimLon$vals), length(dimLat$vals), length(dimTime$vals)))

# Write the data to the netCDF file
ncdf4::ncvar_put(nc, varDummy, data)

# Close the netCDF file
ncdf4::nc_close(nc)

