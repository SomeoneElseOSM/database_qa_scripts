# ----------------------------------------------------------------------------
# purge_old_tiles.sh
#
# Tiles are served by Apache to users as .png files, but stored locally in
# files such as /var/cache/renderd/tiles/ajt/9/0/0/0/0/0/250/128.meta .
# The location of these files is determined by the settings in the
# "renderd.conf" file, which typically lives in /etc .  For modern
# systems tiles will typically be below /var/cache/renderd by default;
# previously /var/lib/mod_tile was used.  A combination of "tile_dir"
# from that config and the layer name is used.
#
# After the layer name (in the example above "ajt") is the zoom level, and
# then either 5 numbers in the standard mod_tile, or 7 in one modified for
# higher zoom levels such as
# https://github.com/SomeoneElseOSM/mod_tile/tree/zoom2022 .
#
# When a tile is marked "dirty" the access time is set to a long time ago
# (20 years or about 240 months ago in the standard mod_tile).
# If it is left dirty for 3 months, it'll appear to have been last accessed
# > 243 months ago.
# Higher zoom tiles that aren't dirtied have to be looked for using more a 
# recent modification time (3 months).
# Lower zoom tiles that aren't dirtied likewise, but we're more tolerant of
# older tiles.   Actually "rerender_low.sh" will rerender these much sooner.
#
# ----------------------------------------------------------------------------
# When newly dirtied tiles have been dirty for 3 months, purge them
# ----------------------------------------------------------------------------
find /var/lib/mod_tile/ajt -type f ! -newermt `date +%Y%m%d --date="243 month ago"` -exec rm {} \; -print
#
# ----------------------------------------------------------------------------
# Which metatiles are dirtied by render_expired and which are deleted (or
# ignored) depends on how render_expired is called from e.g. call_pyosmium.sh.
# Here we're assuming parameters of "--min-zoom=13 --touch-from=13 --delete-from=19 --max-zoom=20".
#
# High zoom tiles are deleted by render_expired so no need to process here.
# Low zoom tiles aren't dirtied; just check for files over 6 months old.
# ----------------------------------------------------------------------------
find /var/lib/mod_tile/ajt/12 -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/11 -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/10 -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/? -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
#
