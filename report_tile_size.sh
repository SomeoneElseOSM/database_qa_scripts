# ----------------------------------------------------------------------------
# report_tile_size.sh
#
# Tiles are served by Apache to users as .png files, but stored locally in
# files such as /var/cache/renderd/tiles/ajt/9/0/0/0/0/0/250/128.meta .
# The location of these files is determined by the settings in the
# "renderd.conf" file, which typically lives in /etc .  For modern
# systems tiles will typically be below /var/cache/renderd by default;
# previously /var/lib/mod_tile was used.  A combination of "tile_dir"
# from that config and the layer name is used.
#
# Display the disk space used by tiles at various zoom levels.
# 
# ----------------------------------------------------------------------------
hostname
echo "Tile Size"
cd /var/cache/renderd/tiles/ajt
du -s .
du -s * | sort -n -r  | head -17
df .
