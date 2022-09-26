# ------------------------------------------------------------------------------
# Count pieces that form part of an LDP, and see if there are more or fewer that
# when we last looked.
#
# First check that we have at least one argument.
# Second argument, if passed, is a name.
#
# An example root cron entry would be:
# 51 10 * * * sudo /path/to/count_generic.sh 86542    Staffordshire_Way_Rushton_Spencer-Cannock_Chase
#
# "psql" seems to try and fail to "cd /root" when invoked this way; but if the
# failure is consistent it isn't a problem that it always produces that output.
#
# "local_filesystem_user" will be whatever account you set it up under.
# On Ubuntu 20.04 and below "local_renderd_user" will be whatever account you
# set it up under; the one that owns the database.
# On Debian 11 / Ubuntu 21.04 and above "local_renderd_user" will typically
# be "_renderd"
# ------------------------------------------------------------------------------
local_filesystem_user=ajtown
local_renderd_user=_renderd
#
if [ $# -eq 0 ]
then
    echo "$0 - no arguments passed"
else
    #echo "$0 - $# arguments passed"     #debug
    mv /home/${local_filesystem_user}/data/ldp_$1.justnow /home/${local_filesystem_user}/data/ldp_$1.previously
    sudo -u ${local_renderd_user} psql -d gis -c "SELECT count(*) FROM planet_osm_line WHERE (osm_id = '-$1');" > /home/${local_filesystem_user}/data/ldp_$1.justnow 2> /home/${local_filesystem_user}/data/ldp_$1.err
    diff /home/${local_filesystem_user}/data/ldp_$1.previously /home/${local_filesystem_user}/data/ldp_$1.justnow | grep -v "could not change directory" | grep -v 1d0 > /home/${local_filesystem_user}/data/ldp_$1.diff 
    wclines=`cat /home/${local_filesystem_user}/data/ldp_$1.diff | wc -l`;
    #echo $wclines;  #debug
    if [ $wclines -ne 0 ]
    then
	echo "Change in relation components for $2 $1"
	cat /home/${local_filesystem_user}/data/ldp_$1.diff
	echo https://www.openstreetmap.org/relation/$1
	echo http://ra.osmsurround.org/analyzeMap?relationId=$1
	# echo
	# echo 'https://overpass-turbo.eu/?Q=[out:xml][timeout:2500];rel('${1}');(._;>>;);way._(changed:"2021-10-17T07:00:00Z");(._;>;);out body;out skel qt;'
    fi
    
    rm /home/${local_filesystem_user}/data/ldp_$1.diff
fi

