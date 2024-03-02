# ----------------------------------------------------------------------------
# Display the disk space used by tiles at various zoom levels
# Must be run as a user that has access to postgres database files
# (by default this is postgresql)
# This script is only useful if the only databases on the server are for
# serving tiles.
#
# Copyright (C) 2021-2024  Andy Townsend
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
# ----------------------------------------------------------------------------
hostname
echo "Database Size"
cd /var/lib/postgresql
du -s .
df .

