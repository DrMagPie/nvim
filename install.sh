#!/bin/sh

BREW_PACKEGES='nvim git python3 lua node yarn ripgrep fzf'
APT_PACKEGES='nvim git python3 python3-pip nodejs yarn ripgrep fzf'
APK_PACKEGES='neovim git python3 py3-pip nodejs yarn fzf linux-headers musl-dev ctags'
PACMAN_PACKEGES='nvim git python python-pip nodejs yarn ripgrep fzf'
NODE_PACKEGE='neovim'
COC_PACKEGE='coc-sh coc-snippets coc-actions coc-tasks coc-pairs coc-floaterm coc-emoji coc-yaml coc-python coc-pyright coc-explorer coc-prettier coc-vimlsp coc-yank coc-json'
PYTHON_PACKEGE='pynvim neovim-remote'

echo
echo ' ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓'
echo ' ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒'
echo '▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░'
echo '▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ '
echo '▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒'
echo '░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░'
echo '░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░'
echo '   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   '
echo '         ░    ░  ░    ░ ░        ░   ░         ░   '
echo '                                ░                  '
echo

curl -s https://gist.githubusercontent.com/DrMagPie/40048602b3cf3ee51276d7ab23b30c4a/raw/0549d5008407a5a6b24138cd7d4506b2c1570ce6/utilities.sh -Lfo /tmp/source.sh
. /tmp/source.sh

log_info 'Checking permissions'
if [ "$(whoami)" != "root" ]; then
  log_warn 'Root permissions required'
  sudo whoami >/dev/null
fi
log_info 'Installing packages'
case "$(get_packege_manager)" in
brew)
  if ! command -v brew >/dev/null; then
    log_warn 'Brew is missing.'
    log_info 'Installing HomeBrew'
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  brew install $BREW_PACKEGES
  ;;
apt)
  sudo apt update
  sudo apt install $APT_PACKEGES
  ;;
apk)
  if ! command -v sudo >/dev/null; then
    log_warn 'sudo is missing.'
    log_info 'Installing sudo'
    apk add sudo
  fi
  sudo apk update
  sudo apk add $APK_PACKEGES
  ;;
packman) sudo pacman -S $PACMAN_PACKEGES ;;
esac
command -v python3 >/dev/null || log_error 'Python 3 is missing'
command -v pip3 >/dev/null || log_faital 'pip 3 is required'
#   sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#   python3 get-pip.py
#   rm get-pip.py
log_info 'Installing Python packages'
sudo pip3 install $PYTHON_PACKEGE
command -v yarn >/dev/null || log_faital 'yarn is required'
log_info 'Installing Node packages'
yarn global add $NODE_PACKEGE
log_info 'Installing CoC packages'
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions || log_faital 'Failed to creat ~/.config/coc/extensions'
[ ! -f package.json ] && echo '{"dependencies":{}}' >package.json
yarn add --ignore-scripts --no-bin-links --no-lockfile --prod $COC_PACKEGE
command -v git >/dev/null || log_faital 'Git is rquired'
cd ~/.config || log_faital 'Dir not found ~/.config'
git clone git@github.com:DrMagPie/nvim.git
command -v nvim >/dev/null || log_faital 'NeoVim is rquired'
nvim --headless +PlugInstall +qall >/dev/null 2>&1

rm /tmp/source.sh
