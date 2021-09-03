#!/bin/bash
DASH_TO_DOCK_DIR_ROOT="/usr/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com"
DASH_TO_DOCK_DIR_HOME="${HOME}/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com"

if [[ -d "${DASH_TO_DOCK_DIR_HOME}" ]]; then
    copy_file "${pwd}/stylesheet.css" "${DASH_TO_DOCK_DIR_HOME}/stylesheet.css"
elif [[ -d "${DASH_TO_DOCK_DIR_ROOT}" ]]; then
    copy_file "${pwd}/stylesheet.css" "${DASH_TO_DOCK_DIR_ROOT}/stylesheet.css" "yes"
else 
    echo "Could NOT found Dash to dock instalation dir, please re-check your setup or re-isntall the dash-to-dock"
    exit 1
fi

copy_file() {
    local src_file="$1"
    local dest_file="$2"
    local xudo="${3:-no}"
    #Do NOT overwrite the backup if it is already their
    local backup_cmd="\cp -n ${dest_file} ${dest_file}.bak"
    
     #Always overwrite this file and don't care what it was
    local copy_cmd="\cp -f ${src_file} ${dest_file}"
    
    if [[ "${xudo}" == "yes" ]]; then
        sudo cp -n ${dest_file} ${dest_file}.bak
        sudo cp -f ${src_file} ${dest_file}    
    else 
        \cp -n ${dest_file} ${dest_file}.bak
        \cp -f ${src_file} ${dest_file}
    fi
}