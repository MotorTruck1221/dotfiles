if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""
alias vim="nvim"

status --is-interactive; and rbenv init - fish | source
thefuck --alias | source
starship init fish | source
