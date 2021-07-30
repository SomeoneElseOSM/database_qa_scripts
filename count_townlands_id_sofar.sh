# ------------------------------------------------------------------------------
# Count national parks, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
#PATH=/home/renderaccount/bin:/home/renderaccount/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (admin_level = '10') AND (place = 'locality');" > /home/renderaccount/data/townlands_id.temp
diff /home/renderaccount/data/townlands_id.temp /home/renderaccount/data/townlands_id.justnow
rm /home/renderaccount/data/townlands_id.temp
#
