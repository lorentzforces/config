#!/usr/bin/env bash

PATH=${ ensure-path "/home/linuxbrew/.linuxbrew/sbin"; }
PATH=${ ensure-path "/home/linuxbrew/.linuxbrew/bin"; }
PATH=${ ensure-path "$HOME/.cargo/bin"; }
PATH=${ ensure-path "/usr/local/go/bin"; }
export PATH
