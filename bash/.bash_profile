if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

loaded_mes="LOADED     -"
not_loadeed_mes="NOT LOADED -"

# to turn off any of the .bash_ext/ scripts, do not symlink them
if [ -r ~/.bash_ext/nvm_init.sh ]; then
  source ~/.bash_ext/nvm_init.sh
fi

if [ -r ~/.bash_ext/mac_env.sh ]; then
  source ~/.bash_ext/mac_env.sh
fi

# to turn off any of the .bash_ext/ scripts, do not symlink them
if [ -r ~/.bash_ext/fzf_func.sh ]; then
  source ~/.bash_ext/fzf_func.sh
fi

