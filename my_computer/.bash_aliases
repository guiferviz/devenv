
# Screen light.
alias r="redshift -O 3500K -b 0.5"
alias rr="redshift -O 2500K -b 0.5"
alias b="xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness 0.5"
alias bb="xrandr --output $(xrandr | grep -o '^eDP[^ ]*') --brightness 1"

# Clipboard.
alias clipboard="xclip -selection c"

# Open any file from the terminal easily.
alias o="xdg-open"

