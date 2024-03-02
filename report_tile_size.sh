# ----------------------------------------------------------------------------
# report_tile_size.sh
#
# Tiles are served by Apache to users as .png files, but stored locally in
# files such as /var/cache/renderd/tiles/ajt/9/0/0/0/0/0/250/128.meta .
# The location of these files is determined by the settings in the
# "renderd.conf" file, which typically lives in /etc .  For modern
# systems tiles will typically be below /var/cache/renderd by default;
# previously /var/lib/mod_tile was used.  A combination of "tile_dir"
# from that config and the layer name is used.
#
# Display the disk space used by tiles at various zoom levels.
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
echo "Tile Size"
cd /var/cache/renderd/tiles/ajt
du -s .
du -s * | sort -n -r  | head -17
df .
