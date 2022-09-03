# ----------------------------------------------------------------------------
# rerender_low.sh
#
# This uses https://github.com/alx77/render_list_geo.pl .
# The parameters below rerender zooms 1-12 for the UK and Ireland for "ajt".
# ----------------------------------------------------------------------------
local_filesystem_user=renderaccount
/home/${local_filesystem_user}/src/render_list_geo.pl/render_list_geo.pl -n 1 -z 3 -Z 12 -x -9.5 -X 2.72 -y 49.39 -Y 61.26 -m ajt
