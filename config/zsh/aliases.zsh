# Enable aliases to be sudo’ed
alias sudo="sudo "

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Shortcuts
alias ls="ls --color"
alias -- +x="chmod +x"
alias o="open"
alias oo="open ."
alias e="$EDITOR"

# trash-cli: https://github.com/sindresorhus/trash-cli
[ -d ~/dotfiles/node_modules/trash-cli ] && alias rm="~/dotfiles/node_modules/trash-cli/cli.js"

# Download file and save it with filename of remote file
alias get="curl -O -L"

# Run npm script without annoying noise
alias nr="npm run --silent"

# Jest watch
alias j="npx jest --watch"

# Make a directory and cd to it
take() {
  mkdir -p $@ && cd ${@:$#}
}

# Magic Project Opener
repo() {
  cd "$(~/config/bin/repo $1)"
}



# git clone and cd to a repo directory
clone() {
  git clone --depth=1 $@
  if [ "$2" ]; then
    cd "$2"
  else
    cd $(basename "$1" .git)
  fi
  npm install
}

## Dotfiles management aliases ##

# All dotfiles are located at the locations `~/config`, `~`, `~/.config`
# All files will be located wrt the home directory

# A bare repository by defining the git directory and the work tree
alias dotbot='/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
# Do not show the untracked files, required to run while setup is done
# dotbot config --local status.showUntrackedFiles no
# config status change 
alias dotsdiff='dotbot diff'
# sync dotfiles 
dotsync() {
  # Automatically add the config folder, rest are added manually as they
  # may not be inteded to be synced up
	dotbot add ~/config/*
	dotbot commit -m "$1"
	dotbot push ssh master
}