# ----------------------------------------------------------------------------
# rerender_low.sh
#
# This uses https://github.com/alx77/render_list_geo.pl .
# The parameters below rerender zooms 1-12 for the UK and Ireland for "ajt".
# ----------------------------------------------------------------------------
PATH=/home/renderaccount/bin:/home/renderaccount/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
/home/renderaccount/src/render_list_geo.pl/render_list_geo.pl -n 1 -z 1 -Z 12 -x -9.5 -X 2.72 -y 49.39 -Y 61.26 -m ajt
