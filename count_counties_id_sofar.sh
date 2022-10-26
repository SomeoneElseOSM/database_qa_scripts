# ------------------------------------------------------------------------------
# Count national parks, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
local_filesystem_user=ajtown
local_renderd_user=_renderd
sudo -u ${local_renderd_user} psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (place = 'county');" > /home/${local_filesystem_user}/data/counties_id.temp 2> /dev/null
diff /home/${local_filesystem_user}/data/counties_id.justnow /home/${local_filesystem_user}/data/counties_id.temp
rm /home/${local_filesystem_user}/data/counties_id.temp
#
