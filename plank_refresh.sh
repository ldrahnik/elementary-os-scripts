#!/bin/bash

KEY="/net/launchpad/plank/docks/dock1/hide-mode"

CURRENT=$(dconf read "$KEY")

if [[ "$CURRENT" == "'autohide'" ]]; then
    TEMP="'intellihide'"
else
    TEMP="'autohide'"
fi

# switch to something else
dconf write "$KEY" "$TEMP"

# and set up back none
dconf write "$KEY" "'none'"