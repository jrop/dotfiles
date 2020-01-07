function dzf
    set selected (docker ps --format '{{json .}}' $argv | jq -r '.Names + " | " + .Image + " | " + .ID' | fzf-tmux)
    if test -z $selected
        return 1
    end
    echo $selected | awk -F '|' '{print $3}'
end

