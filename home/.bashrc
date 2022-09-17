#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias update-mirrors='curl -s "https://archlinux.org/mirrorlist/?country=US&country=BR&protocol=https&protocol=http&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 10 -'
alias update-mirrors-pro='curl -s "https://archlinux.org/mirrorlist/?country=all&protocol=http&protocol=https&ip_version=4&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 10 -'
alias removeorphansp="sudo pacman -Rns $(pacman -Qtdq)"
alias removeorphansy="yay -Rns $(yay -Qtdq)"
alias yolo="sudo pacman -Syyuu && yay -Syyuu"
PS1='[\u@\h \W]\$ '

