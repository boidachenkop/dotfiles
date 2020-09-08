#!/bin/bash

wp_db=/home/pavlo/.config/i3/workspaces.json
number=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')
default_name=$(jq -r --arg number $number '.[] | select(.num==($number | tonumber)) | .name+" "+.logo' $wp_db)
name="$number: $default_name"
i3-msg "rename workspace to \"${name}\""
