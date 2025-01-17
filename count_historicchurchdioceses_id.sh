# -----------------------------------------------------------------------------
# Count historic dioceses, and see if there are more or fewer that when we last
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
local_filesystem_user=ajtown
local_renderd_user=_renderd
mv /home/${local_filesystem_user}/data/historicchurchdioceses_id.justnow /home/${local_filesystem_user}/data/historicchurchdioceses_id.previously
sudo -u ${local_renderd_user} psql -d gis -c "SELECT distinct osm_id,name FROM planet_osm_polygon WHERE (boundary = 'historic_diocese');" > /home/${local_filesystem_user}/data/historicchurchdioceses_id.justnow 2> /dev/null
diff /home/${local_filesystem_user}/data/historicchurchdioceses_id.previously /home/${local_filesystem_user}/data/historicchurchdioceses_id.justnow
#
