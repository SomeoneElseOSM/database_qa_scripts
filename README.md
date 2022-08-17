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

Also, very low and very high zoom tiles typically aren't dirtied in the same way.

### rerender_low.sh

This calls "render_list_geo.pl" to rerender low-zoom tiles in a bouncing box.

## Area feature checking

(to be written later)

## Linear feature checking

(to be written later)

