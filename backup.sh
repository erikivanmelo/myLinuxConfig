#! /bin/bash
#
# Script for backing up configuration and package lists
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the Affero GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# @linux-aarhus - root.nix.dk
#
# Modify as necessary
#filelist=('.bash_profile' '.bashrc' '.netrc' '.profile' '.zshrc')
# example folderlist=('.config' '.local' '.gnupg' '.mozilla' '.ssh' '.thunderbird')
#folderlist=('.config' '.local')

#archive_file="dotconf.tar.gz"
repo_pkg_file="repo-pkglist.txt"
cust_pkg_file="cust-pkglist.txt"
# /Modification

SCRIPTNAME=$(basename "$0")
VERSION="0.1"
if [[ -z $1 ]]; then
    echo ":: $SCRIPTNAME v$VERSION"
    echo "==> missing argument: PATH"
    echo "Usage:"
    echo "  $SCRIPTNAME /path/to/backup"
    echo "  Path to store output"
    echo "  e.g. $SCRIPTNAME /home/$USER/backup"
    echo ""
    exit
fi

set -e

if ! [[ -d $1 ]]; then
    mkdir -p $1
fi

#conf_archive="$1/$archive_file"
repo_pkg_list="$1/$repo_pkg_file"
cust_pkg_list="$1/$cust_pkg_file"

# create an archive of common hidden files and folders

if [[ -e "$conf_archive" ]]; then
    # remove archive if exist
    rm -f "$conf_archive"
fi

todo=""
#for file in ${filelist[@]}; do
#    if [[ -f $file ]]; then
#        todo+="${file} "
#    fi
#done

#for folder in ${folderlist[@]}; do
#    if [[ -d ${folder} ]]; then
#        todo+="${folder} "
#    fi
#done

#tar -zcvf "$conf_archive" $todo

# list packages from official repo
pacman -Qqen > "$repo_pkg_list"

# list foreign packages (custom e.g. AUR)
pacman -Qqem > "$cust_pkg_list"

echo " ==> Packagelists created"
echo "   --> $repo_pkg_list"
echo "   --> $cust_pkg_list"
#echo " ==> Config archive created"
#echo "   --> $conf_archive"
echo " ==> To install packages from lists"
echo "   --> sudo pacman -Syu --needed - < $repo_pkg_file"
#echo " ==> To restore the configuration files run"
#echo "   --> tar -xzf $archive_file"
echo ""
