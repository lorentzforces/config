if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

# to turn off any of the .bash_ext/ scripts, do not symlink them
if [ -r ~/.bash_ext/nvm_init.sh ]; then
  source ~/.bash_ext/nvm_init.sh
fi
