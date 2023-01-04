# ----------------------------------------------------------------------------
# rerender_low.sh
#
# This uses https://github.com/alx77/render_list_geo.pl .
# The parameters below rerender zooms 1-12 for the UK and Ireland for "ajt".
#
# Copyright (C) 2021-2023  Andy Townsend
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
local_filesystem_user=renderaccount
/home/${local_filesystem_user}/src/render_list_geo.pl/render_list_geo.pl -n 1 -z 3 -Z 12 -x -9.5 -X 2.72 -y 49.39 -Y 61.26 -m ajt
