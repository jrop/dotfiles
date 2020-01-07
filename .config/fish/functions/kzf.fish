function kzf
    kubectl get -o json $argv | jq -r '.items[].metadata.name' | fzf-tmux
end

