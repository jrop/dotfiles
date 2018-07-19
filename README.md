dotfiles
========

My dotfiles, delivered via Ansible.

## Install

```sh
curl -sSL https://raw.githubusercontent.com/jrop/dotfiles/master/install.sh | sh

# Install rc files only:
ansible-playbook playbook.yml --tags ""

# For everything:
ansible-playbook playbook.yml
```
