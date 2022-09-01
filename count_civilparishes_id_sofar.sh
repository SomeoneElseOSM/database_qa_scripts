# ------------------------------------------------------------------------------
# Count national parks, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
local_filesystem_user=ajtown
local_renderd_user=_renderd
sudo -u ${local_renderd_user} psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (boundary = 'civil_parish');" > /home/${local_filesystem_user}/data/civilparishes_id.temp 2> /dev/null
diff /home/${local_filesystem_user}/data/civilparishes_id.temp /home/${local_filesystem_user}/data/civilparishes_id.justnow
rm /home/${local_filesystem_user}/data/civilparishes_id.temp
#
