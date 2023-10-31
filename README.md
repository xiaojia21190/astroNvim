##

首先，在windows盘里下载tar.gz文件，可以使用wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz 地址来进行下载

然后在wsl中cd到这个目录，不如cd /mn/d/Ubuntu

然后解压缩>tar xzvf nvim-linux64.tar.gz

然后到解压后的目录里运行nvim

>./nvim-linux64/bin/nvim

版本号0.10

然后把这个文件夹复制到

$ sudo cp ./nvim-linux64/bin/nvim /usr/bin/nvim

$sudo cp -r nvim-linux64/share/nvim/runtime /usr/share/nvim/runtime/

## No C compiler found! "cc", "gcc", "clang", "cl", "zig" are not executable.  
sudo apt-get install build-essential

## ripgrep
sudo apt-get install ripgrep

## lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

## nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash


## zsh 
https://juejin.cn/post/7064161133996802061




# AstroNvim User Configuration Example

A user configuration template for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```
