# ------------------------------------------------------------------------------
# Count national parks, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
local_filesystem_user=ajtown
local_renderd_user=_renderd
mv /home/${local_filesystem_user}/data/baronies_id.justnow /home/${local_filesystem_user}/data/baronies_id.previously
sudo -u ${local_renderd_user} psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (boundary = 'barony');" > /home/${local_filesystem_user}/data/baronies_id.justnow 2> /dev/null
diff /home/${local_filesystem_user}/data/baronies_id.justnow /home/${local_filesystem_user}/data/baronies_id.previously
#
