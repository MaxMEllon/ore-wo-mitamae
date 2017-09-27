include_recipe 'lib/recipe_helper'

include_attribute 'common'

include_cookbook 'nodenv'
include_cookbook 'rbenv'
include_cookbook 'pyenv'
include_cookbook 'goenv'

# commands
include_cookbook 'git'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'vim'
include_cookbook 'jq'

# dotfiles
include_cookbook 'dotfiles'
include_cookbook 'vimrc'
