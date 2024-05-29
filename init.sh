#!/usr/bin/env bash

function usage() {
    cat >&2 <<EOF
usage: $0 <namespace> <collection_name>
EOF
    exit 1
}

[[ "$#" -ne 2 ]] && usage
[ -d "collection" ] && echo >&2 "collection already exists" && exit 1

if [[ $(which ansible-creator) ]]; then
  mkdir collection && cd collection &&  ansible-creator init $1.$2
else 
    #ansible-galaxy collection init $1.$2
    if [[ ! $(which pip3) ]]; then
        echo >&2 "pip3 not installed, exiting." && exit 1
    fi
  
    pip3 install ansible-creator
    export PATH="$PATH:$HOME/.local/bin"
    ansible-creator init $1.$2
fi


	
