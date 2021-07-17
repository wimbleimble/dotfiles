#! /bin/bash

killall -q dunst

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

printf $SCRIPT_DIR/start_dunst.sh

$SCRIPT_DIR/start_dunst.sh

dunstify test


