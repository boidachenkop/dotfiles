#!/bin/bash
# interactively rename workspace with dmenu

full_name=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name')
echo "Full name: \n\n $full_name"
name=$(echo $full_name | grep -Po '(?<=:).*(?=")')
number=$(echo $full_name | grep -Po '(?<=^")[0-9]+')
echo "workspace number: $number"
new_name=$(dmenu -h 25 -b -p "Workspace ${number}:")
if [[ $new_name =~ [0-9].* ]]; then
    new_workspace_name="${new_name}"
elif [[ -n "${new_name}" ]]; then
    new_workspace_name="${number}: ${new_name}"
else
    new_workspace_name="${number}"
fi
i3-msg "rename workspace to \"${new_workspace_name}\""
