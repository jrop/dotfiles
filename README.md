# jrop/dotfiles

> Dotfiles for bash/fish/git/tmux/{,neo}vim and more!

The philosophy for my dotfiles is: less is more.  I don't do anything crazy,
but I do customize things a bit to be more assistive.

Highlights:
* Graceful feature detection, to get "more", invoke the `install_*` helper
  functions from the shells
* FZF in shells/{,neo}vim
* Patched font installation in bootstrap scripts and Brewfile
* ...other niceties

# Using

```sh
sudo apt-get update
sudo apt-get install git yadm
yadm clone https://github.com/jrop/dotfiles
yadm bootstrap
```

# Licence (MIT)

Copyright 2020 Jonathan Apodaca <jrapodaca@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
