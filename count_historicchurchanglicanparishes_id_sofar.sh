# ------------------------------------------------------------------------------
# Count a particular area feature, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
local_filesystem_user=ajtown
local_renderd_user=_renderd
sudo -u ${local_renderd_user} psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (boundary = 'historic_parish') AND (denomination = 'anglican');" > /home/${local_filesystem_user}/data/historicchurchanglicanparishes_id.temp 2> /dev/null
diff /home/${local_filesystem_user}/data/historicchurchanglicanparishes_id.temp /home/${local_filesystem_user}/data/historicchurchanglicanparishes_id.justnow
rm /home/${local_filesystem_user}/data/historicchurchanglicanparishes_id.temp
#
