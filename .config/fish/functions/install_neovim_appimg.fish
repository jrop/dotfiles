function install_neovim_appimg
  set nvim_path $HOME/.local/bin/nvim
  curl -Lo $nvim_path https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
  chmod u+x $nvim_path
end
