# -----------------------------------------------------------------------------
# Count townlands, and see if there are more or fewer that when we last
# looked.
#
# Copyright (C) 2021-2025  Andy Townsend
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
# -----------------------------------------------------------------------------
# 29/11/2025 17:11:
# Amended script to send output to a local alias "townlands" rather then just
# relying on cron output.  The "townlands" alias in /etc/aliases will receive mail.
# -----------------------------------------------------------------------------
local_filesystem_user=ajtown
local_renderd_user=_renderd
mv /home/${local_filesystem_user}/data/townlands_id.justnow /home/${local_filesystem_user}/data/townlands_id.previously
sudo -u ${local_renderd_user} psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (admin_level = '10') AND (place = 'locality');" > /home/${local_filesystem_user}/data/townlands_id.justnow 2> /dev/null
diff /home/${local_filesystem_user}/data/townlands_id.previously /home/${local_filesystem_user}/data/townlands_id.justnow > /home/${local_filesystem_user}/data/townlands_id.diff
#
wclines=`cat /home/${local_filesystem_user}/data/townlands_id.diff | wc -l`;
if [ $wclines -ne 0 ]
then
    cat /home/${local_filesystem_user}/data/townlands_id.diff | mail -s "Change in number or name of townlands" townlands
fi
#
