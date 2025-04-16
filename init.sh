#!/usr/bin/env bash

# This simply inits our git setup in the easiest and simplest way
nix --extra-experimental-features nix-command --extra-experimental-features flakes run nixpkgs#git -- clone https://github.com/motortruck1221/dotfiles/ ~/.dotfiles/ -b nix
