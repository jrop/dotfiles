function bw_fzf
    set selected_line (
        bw list items \
            | jq '.[] | "\(.name) | username: \(.login.username) | id: \(.id)" ' \
            | fzf --preview "echo {} | awk '{print \$(NF -0)}' | sed 's/\"//g' | xargs bw get item | jq '.'" \
    )
    if test -z $selected_line
        echo bw_fzf cancelled
        return
    end

    echo $selected_line \
        | awk '{print $(NF -0)}' \
        | sed 's/\"//g' \
        | xargs bw get item \
        | jq '.login.password' \
        | sed 's/\"//g' \
        | xargs tmux set-buffer
    echo Copied password to tmux buffer
end

