# ------------------------------------------------------------------------------
# Count national parks, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
local_filesystem_user=ajtown
local_renderd_user=_renderd
sudo -u ${local_renderd_user} psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (admin_level = '10') AND (place = 'locality');" > /home/${local_filesystem_user}/data/townlands_id.temp
diff /home/${local_filesystem_user}/data/townlands_id.temp /home/${local_filesystem_user}/data/townlands_id.justnow
rm /home/${local_filesystem_user}/data/townlands_id.temp
#
