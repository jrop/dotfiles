FROM ubuntu
RUN apt update && apt install -y git yadm
RUN yadm clone https://github.com/jrop/dotfiles
RUN bash ~/.config/yadm/bootstrap##distro.Ubuntu
