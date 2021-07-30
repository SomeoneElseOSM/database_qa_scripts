# ------------------------------------------------------------------------------
# Count pieces that form part of an LDP, and see if there are more or fewer that
# when we last looked.
#
# First check that we have at least one argument.
# Second argument, if passed, is a name.
# ------------------------------------------------------------------------------
if [ $# -eq 0 ]
then
    echo "$0 - no arguments passed"
else
    #echo "$0 - $# arguments passed"     #debug
    psql -d gis -c "SELECT count(*) FROM planet_osm_line WHERE (osm_id = '-$1');" > /home/renderaccount/data/ldp_$1.temp
    diff /home/renderaccount/data/ldp_$1.temp /home/renderaccount/data/ldp_$1.justnow > /home/renderaccount/data/ldp_$1.diff
    wclines=`cat /home/renderaccount/data/ldp_$1.diff | wc -l`;
    #echo $wclines;  #debug
    if [ $wclines -ne 0 ]
    then
	echo "Change in relation components for $2 $1"
	cat /home/renderaccount/data/ldp_$1.diff
    fi
    
    rm /home/renderaccount/data/ldp_$1.diff
fi

