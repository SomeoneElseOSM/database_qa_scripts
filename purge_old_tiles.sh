# ----------------------------------------------------------------------------
# purge_old_tiles.sh
#
# When a tile is marked "dirty" the access time is set to a long time ago
# (20 years or about 240 months ago in the standard mod_tile; 10k days or 
# about 27 years or 333 months in my version)
# If it is left dirty for 3 months, it'll appear to have been last accessed
# > 336 months ago.
# Higher zoom tiles that aren't dirtied have to be looked for using more a 
# recent modification time (3 months).
# Lower zoom tiles that aren't dirtied likewise, but we're more tolerant of
# older tiles.   Actually "rerender_low.sh" will rerender these much sooner.
#
# ----------------------------------------------------------------------------
# When newly dirtied tiles have been dirty for 3 months, purge them
# ----------------------------------------------------------------------------
find /var/lib/mod_tile/ajt -type f ! -newermt `date +%Y%m%d --date="332 month ago"` -exec rm {} \; -print
#
# ----------------------------------------------------------------------------
# When tiles dirtied at 20 years have been dirty for 3 months, purge them
# ----------------------------------------------------------------------------
find /var/lib/mod_tile/ajt -type f ! -newermt `date +%Y%m%d --date="243 month ago"` -newermt `date +%Y%m%d --date="328 month ago"` -exec rm {} \; -print
#
# ----------------------------------------------------------------------------
# High zoom tiles aren't dirtied; check for 3 months.
# ----------------------------------------------------------------------------
find /var/lib/mod_tile/ajt/19 -type f ! -newermt `date +%Y%m%d --date="3 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/2? -type f ! -newermt `date +%Y%m%d --date="3 month ago"` -exec rm {} \; -print
#
# ----------------------------------------------------------------------------
# Low zoom tiles aren't dirtied; just check for 6 months.
# ----------------------------------------------------------------------------
find /var/lib/mod_tile/ajt/12 -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/11 -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/10 -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print
find /var/lib/mod_tile/ajt/? -type f ! -newermt `date +%Y%m%d --date="6 month ago"` -exec rm {} \; -print

#
