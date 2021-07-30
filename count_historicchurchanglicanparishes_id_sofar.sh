# ------------------------------------------------------------------------------
# Count a particular area feature, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
#PATH=/home/renderaccount/bin:/home/renderaccount/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (boundary = 'historic_parish') AND (denomination = 'anglican');" > /home/renderaccount/data/historicchurchanglicanparishes_id.temp
diff /home/renderaccount/data/historicchurchanglicanparishes_id.temp /home/renderaccount/data/historicchurchanglicanparishes_id.justnow
rm /home/renderaccount/data/historicchurchanglicanparishes_id.temp
#
