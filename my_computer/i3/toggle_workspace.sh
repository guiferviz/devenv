#!/bin/sh

toggle_workspace=$1
if [ -z "$1" ]
then
    echo "No argument supplied: toggle workspace"
    exit 1
fi
current_workspace=$(i3-msg -t get_workspaces | jq -r ".[] | select(.focused==true).name")


if [ $toggle_workspace -eq $current_workspace ]
then
    # Go back to the previous workspace.
    i3-msg workspace back_and_forth
else
    # Go to the desired workspace.
    i3-msg workspace number $toggle_workspace
fi

