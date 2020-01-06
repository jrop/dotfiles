function bw
    set bw_path (command -s bw)
    if test -z $bw_path
        echo "Bitwarden is not installed"
        read -P "Install @bitwarden/cli? [yN] " confirm
        switch $confirm
            case 'y' 'Y'
                npm install --global @bitwarden/cli
            case '*'
                return 1
        end
    end

    if test "$argv[1]" = "fzf"
        #
        # FZF
        #
        set selected_line (
            eval $bw_path list items \
                | jq '.[] | "\(.name) | username: \(.login.username) | id: \(.id)" ' \
                | fzf --preview "echo {} | awk '{print \$(NF -0)}' | sed 's/\"//g' | xargs bw get item | jq '.'" \
        )
        if test -z $selected_line
            echo error: `bw fzf` cancelled
            return
        end

        echo $selected_line \
            | awk '{print $(NF -0)}' \
            | sed 's/\"//g' \
            | xargs $bw_path get item \
            | jq '.login.password' \
            | sed 's/\"//g' \
            | xargs tmux set-buffer
        echo Copied password to tmux buffer
    else if test "$argv[1]" = "unlock"
        #
        # Unlock
        #
        set key (eval $bw_path unlock --raw)
        export BW_SESSION=$key
    else
        #
        # Everything else...
        #
        eval $bw_path $argv
    end
end
