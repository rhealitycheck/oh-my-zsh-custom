autoload -Uz bashcompinit && bashcompinit
_fly_compl() {
    args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
    local IFS=$'\n'
    COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
    return 0
}
complete -F _fly_compl fly _fly_cmd

_fly_target() {
    case "$1" in
        set)
            export fly_target=$2
            ;;
        unset)
            unset fly_target
        ;;
    esac
}

_fly_cmd() {
    if [ -n "$fly_target" ]; then
        fly -t $fly_target $@
    else
        fly $@
    fi
}

_fly_aliases() {
    fly | \
    awk '/aliases/ {printf "alias fly%s=\x27_fly_cmd %s\x27\n", $NF, $1}' | \
    tr -d ')'
}

alias flytg='_fly_target set'
alias flyutg='_fly_target unset'

alias_list=$(_fly_aliases)

for entry in $alias_list; do
    eval $entry
done
