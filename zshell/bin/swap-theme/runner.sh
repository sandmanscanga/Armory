#!/bin/bash

BASE_PATH="${HOME}/bin/swap-theme"
CURRENT_THEME_PATH="${BASE_PATH}/current-theme.json"
PREVIOUS_THEME_PATH="${BASE_PATH}/previous-theme.json"

touch $CURRENT_THEME_PATH
cp $CURRENT_THEME_PATH $PREVIOUS_THEME_PATH

python "${BASE_PATH}/core.py" > $CURRENT_THEME_PATH

NEW_THEME_NAME=`cat $CURRENT_THEME_PATH | jq -r .name`
NEW_THEME_PATH=`cat $CURRENT_THEME_PATH | jq -r .path`

export RANDOM_THEME="${NEW_THEME_NAME}"
source "${NEW_THEME_PATH}"
