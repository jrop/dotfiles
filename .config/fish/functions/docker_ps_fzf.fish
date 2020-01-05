function docker_ps_fzf
    set selected (
        docker ps -a --format '{{json .}}' | jq -r '.Names + "|" + .Image + "|" + .ID' | fzf-tmux
    )
    if test -z $selected
        return 1
    end

    echo $selected | awk -F '|' '{print $3}'
end

