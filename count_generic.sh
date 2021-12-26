# ------------------------------------------------------------------------------
# Count pieces that form part of an LDP, and see if there are more or fewer that
# when we last looked.
#
# First check that we have at least one argument.
# Second argument, if passed, is a name.
#
# An example cron entry would be:
# 51 10 * * * /home/renderaccount/bin/count_generic.sh 86542    Staffordshire_Way_Rushton_Spencer-Cannock_Chase
# ------------------------------------------------------------------------------
if [ $# -eq 0 ]
then
    echo "$0 - no arguments passed"
else
    #echo "$0 - $# arguments passed"     #debug
    mv /home/renderaccount/data/ldp_$1.justnow /home/renderaccount/data/ldp_$1.previously
    psql -d gis -c "SELECT count(*) FROM planet_osm_line WHERE (osm_id = '-$1');" > /home/renderaccount/data/ldp_$1.justnow
    diff /home/renderaccount/data/ldp_$1.justnow /home/renderaccount/data/ldp_$1.previously > /home/renderaccount/data/ldp_$1.diff
    wclines=`cat /home/renderaccount/data/ldp_$1.diff | wc -l`;
    #echo $wclines;  #debug
    if [ $wclines -ne 0 ]
    then
	echo "Change in relation components for $2 $1"
	cat /home/renderaccount/data/ldp_$1.diff
	echo https://www.openstreetmap.org/relation/$1
	echo http://ra.osmsurround.org/analyzeMap?relationId=$1
	# echo
	# echo 'https://overpass-turbo.eu/?Q=[out:xml][timeout:2500];rel('${1}');(._;>>;);way._(changed:"2021-10-17T07:00:00Z");(._;>;);out body;out skel qt;'
    fi
    
    rm /home/renderaccount/data/ldp_$1.diff
fi

