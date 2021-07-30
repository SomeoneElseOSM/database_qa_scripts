# ------------------------------------------------------------------------------
# Count national parks, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
#PATH=/home/renderaccount/bin:/home/renderaccount/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (place = 'county');" > /home/renderaccount/data/counties_id.temp
diff /home/renderaccount/data/counties_id.temp /home/renderaccount/data/counties_id.justnow
rm /home/renderaccount/data/counties_id.temp
#
