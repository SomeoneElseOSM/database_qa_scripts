# ----------------------------------------------------------------------------
# Display the disk space used by tiles at various zoom levels
# ----------------------------------------------------------------------------
hostname
echo "Tile Size"
cd /var/lib/mod_tile/ajt
du -s .
du -s * | sort -n -r  | head -17
df .

