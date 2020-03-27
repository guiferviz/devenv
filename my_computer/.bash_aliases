
# Screen light.
alias r="redshift -O 4500K -b 0.5"
alias rr="redshift -O 4000K -b 0.5"
alias rrr="redshift -O 3500K -b 0.5"
alias b="xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness 1"
alias bb="xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness 0.75"
alias bbb="xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness 0.5"
# The next function is not working and I don't know why...
#function b {
#    xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness $1
#}

# Clipboard.
alias clipboard="xclip -selection c"

# Open any file from the terminal easily.
alias o="xdg-open"

