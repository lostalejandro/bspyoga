#
# ~/.bash_profile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 2 ]; then
	exec startx -- keeptty >/dev/null 2>&1
fi
