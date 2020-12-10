#!/bin/bash

_fly_compl() {
	args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
	local IFS=$'\n'
	COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
	return 0
}
complete -F _fly_compl fly

_fly_target() {
	export fly_target="$1"
}

_fly_aliases() {
	read -a -m $(fly | \
	awk '/aliases/ {printf "alias fly%s=\x27 fly -t \$fly_target %s\x27\n", $NF, $1}' | \
	sed "s/)//g;s/' /'/g")
}

export fly_target=prod

alias flytgt=_fly_target

alias_list=$(_fly_aliases)

for entry in ${alias_list[@]}; do
    echo '$entry'
done
