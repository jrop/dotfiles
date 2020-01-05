function install_gitlab_cli
    curl -sSfL https://raw.githubusercontent.com/makkes/gitlab-cli/master/install.sh | sh -s -- -b "$HOME/.local/bin"
end

