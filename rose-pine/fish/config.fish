if status is-interactive
    # Commands to run in interactive sessions can go here
end
export (cat ~/.config/fish/environment/env.txt |xargs -L 1)
pfetch
set fish_greeting ""
alias cod="code . && exit"
alias lockscreenu="~/.config/.scripts/lockscreenwallpaper.sh"
alias vmi='~/.scripts/KVMinstall-master/install_and_delete/vm_install.sh'
alias vmd='~/.scripts/KVMinstall-master/install_and_delete/vm_delete.sh'
alias vms='~/.scripts/KVMinstall-master/start_and_stop/vm_start.sh'
alias vmfs='~/.scripts/KVMinstall-master/start_and_stop/vm_force_stop.sh'
alias vmv='~/.scripts/KVMinstall-master/view/vm_view.sh'
alias vmst='~/.scripts/KVMinstall-master/start_and_stop/vm_stop.sh'
alias vml='~/.scripts/KVMinstall-master/view/vm_list.sh'
alias vmh='~/.scripts/KVMinstall-master/list.sh'
alias vmi='~/.scripts/KVMinstall-master/install_and_delete/vm_install.sh'
alias vmd='~/.scripts/KVMinstall-master/install_and_delete/vm_delete.sh'
alias vms='~/.scripts/KVMinstall-master/start_and_stop/vm_start.sh'
alias vmfs='~/.scripts/KVMinstall-master/start_and_stop/vm_force_stop.sh'
alias vmv='~/.scripts/KVMinstall-master/view/vm_view.sh'
alias vmst='~/.scripts/KVMinstall-master/start_and_stop/vm_stop.sh'
alias vml='~/.scripts/KVMinstall-master/view/vm_list.sh'
alias vmh='~/.scripts/KVMinstall-master/list.sh'
alias fucking='sudo'
alias update='sudo echo "Unpatching vencord..." && sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)" && sudo pacman -Syu && yay -Syu --aur && flatpak upgrade && sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias remove='sudo pacman -Rcns'
alias install='sudo pacman -S'
alias removea='yay -Rcns'
alias installa='yay -S'
alias sync='sudo pacman -Syy && yay -Syy'
alias vim="nvim"
alias cats="python ~/cats/cats.py"
alias pn="pnpm"
alias nodeUpdate="nvm install node && nvm use node && npm i -g yarn pnpm"
alias vinegar="flatpak run io.github.vinegarhq.Vinegar"

thefuck --alias | source
nvm use node

# bun
set -Ux BUN_INSTALL "~/.bun"
fish_add_path "~/.bun/bin"
# flyctl
set -Ux FLYCTL_INSTALL "~/.fly"
fish_add_path "~/.fly/bin/"
alias fly="~/.fly/bin/flyctl"
# Theme
fish_config theme choose "Rosé Pine Moon"

# pnpm
set -gx PNPM_HOME "~/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
fish_add_path /home/tuckerj/.spicetify
status --is-interactive; and rbenv init - fish | source
