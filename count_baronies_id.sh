# ------------------------------------------------------------------------------
# Count national parks, and see if there are more or fewer that when we last
# looked.
# ------------------------------------------------------------------------------
#PATH=/home/renderaccount/bin:/home/renderaccount/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
mv /home/renderaccount/data/baronies_id.justnow /home/renderaccount/data/baronies_id.previously
psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (boundary = 'barony');" > /home/renderaccount/data/baronies_id.justnow
diff /home/renderaccount/data/baronies_id.justnow /home/renderaccount/data/baronies_id.previously
#
