
# Screen light.
alias r="redshift -O 4500K -b 0.5"
alias rr="redshift -O 4000K -b 0.5"
alias rrr="redshift -O 3500K -b 0.5"
alias b="xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness 1"
alias bb="xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness 0.75"
alias bbb="xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness 0.5"
# Use only one screen.
alias s="xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --mode 1368x768 --brightness 1 --output HDMI-1 --off"
# Use external screen.
alias es="xrandr --output HDMI-1 --brightness 1 --mode 1920x1080 --left-of eDP-1 --output eDP-1 --mode 1368x768 --brightness 1"
# The next function is not working and I don't know why...
#function b {
#    xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness $1
#}

# Clipboard.
alias clipboard="xclip -selection c"

# Open any file from the terminal easily.
alias o="xdg-open"

# Change the owner and the group of all the files in this folder recursively.
alias mine="sudo chown -R $(id -nu):$(id -ng) ."

# Fuzzy tools.
alias f="fzf"
# Fuzzy change directory from root.
alias cdr="cd / && \`__fzf_cd__\`"
# Fuzzy change directory from home.
alias cdh="cd ~ && \`__fzf_cd__\`"
# Fuzzy change directory from current dir. Alt+C is an alternative.
alias cdf="\`__fzf_cd__\`"
