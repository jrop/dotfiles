function install_neovim_nightly_appimg
  set nvim_path $HOME/.local/bin/nnvim
  curl -Lo $nvim_path https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x $nvim_path
end
