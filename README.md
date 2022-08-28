# database_qa_scripts
Scripts to monitor OSM objects within a UK/IE-populated rendering database
See https://www.openstreetmap.org/user/SomeoneElse/diary/397310 and https://www.openstreetmap.org/user/SomeoneElse/diary/395232 for some context.

This repository contains a number of crontab entries and a number of scripts run from those crontab entries.  Before installation on any machine the crontab entries and the scripts will need editing to match the local environment (such as "which user owns the postgres database"), the edited scripts will needcopying to somewhere like /usr/local/sbin , and the crontab entries will need editing to match the script locations.

## File and database housekeeping

### report_database_size.sh

This typically runs from the "postgres" user.  Results are written to stdout, mailed to the crontab owner, and it is assumed that that will be forwarded to the desired location via mailutils / postfix.

### report_tile_size.sh

This typically runs from the user that owns the database, which is usually _renderd on newer operating systems.  Results are written to stdout, mailed to the crontab owner, and it is assumed that that will be forwarded to the desired location via mailutils / postfix.

Actual sizes reported will depend very much on how the system is set up and used - as an example, the databases behind https://map.atownsend.org.uk/ are about 70GB with about 7GB of tiles in cache.

Both scripts also report total disk usage.

### purge_old_tiles.sh

The tile expiry process typically marks metatiles as "dirty" rather than deleting them.  However, there comes a time when it's not worth keeping an old dirty tile - if it's not been requested for months we might as well just delete it.

Also, very low and very high zoom tiles typically aren't dirtied in the same way and old ones are deleted periodically.

### rerender_low.sh

This calls "render_list_geo.pl" to rerender low-zoom tiles in a bouncing box.  See https://github.com/alx77/render_list_geo.pl for that.

## Area feature checking

### count_nationalparks_id.sh

This counts national parks, and sees if there are more or fewer that when we last looked.  It uses (boundary = 'national_park') as the selection criterion, but the contents of that are determined by https://github.com/SomeoneElseOSM/SomeoneElse-style/blob/master/style.lua and it includes AoNBs and some marine areas as well as national parks.

A "missing" area probably means that someone has broken the geometry so that it is no longer a valid polygon.

### Various Irish checks (baronies etc.)

These are typically non-admin boundaries that may get broken by accident (many follow other features) that because there's no other QA may not get otherwise fixed.  Admin boundaries are regularly monitored and fixed (worldwide) by other mappers.

## Linear feature checking

The script "count_generic.sh" counts the number of pieces of a linear feature (such as a long distance walking route) and compares with a previous value.  An increase in the number of pieces may just be the result of more detailed mapping, or someone may have create a gap by mistake.

The email generated from "count_generic.sh" includes links to the changed relation and to "http://ra.osmsurround.org/analyzeMap?relationId=" to make it easier to analyse.

The actual checks are invoked from "osm_ldp1", "osm_ldp2" and "osm_ldp3".  There are three of these because cron documents on some OSes are limited to 1000 lines - see https://bugs.launchpad.net/ubuntu/+source/cron/+bug/1972830 .  The "osm_ldp1" script has more details about how these work.

## Example crontab values

"crontab_root.txt", "crontab_renderaccount.txt" and "crontab_postgres.txt" are example crontabs from map.atownsend.org.uk that handle daily housekeeping including certificate renewal and tile rerendering, and also area checks.  The "osm_ldp?" scripts mentioned above handle linear checks.
