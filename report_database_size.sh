# ----------------------------------------------------------------------------
# Display the disk space used by tiles at various zoom levels
# Must be run as a user that has access to postgres database files
# (by default this is postgresql)
# This script is only useful if the only databases on the server are for
# serving tiles.
# ----------------------------------------------------------------------------
hostname
echo "Database Size"
cd /var/lib/postgresql
du -s .
df .

