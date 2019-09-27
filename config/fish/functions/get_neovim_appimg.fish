function get_neovim_appimg
  curl -LO https://github.com/neovim/neovim/releases/download/v0.4.2/nvim.appimage
  chmod u+x nvim.appimage
end
