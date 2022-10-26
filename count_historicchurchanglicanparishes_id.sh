# ------------------------------------------------------------------------------
# Count a particular area feature, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
local_filesystem_user=ajtown
local_renderd_user=_renderd
mv /home/${local_filesystem_user}/data/historicchurchanglicanparishes_id.justnow /home/${local_filesystem_user}/data/historicchurchanglicanparishes_id.previously
sudo -u ${local_renderd_user} psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (boundary = 'historic_parish') AND (denomination = 'anglican');" > /home/${local_filesystem_user}/data/historicchurchanglicanparishes_id.justnow 2> /dev/null
diff /home/${local_filesystem_user}/data/historicchurchanglicanparishes_id.previously /home/${local_filesystem_user}/data/historicchurchanglicanparishes_id.justnow
#
