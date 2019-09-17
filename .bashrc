
# Define bash alias.
# Start jupyter notebooks with one simple command.
alias notebook="python -m notebook --ip=0.0.0.0 --no-browser --allow-root"
# Start tmux with terminal colors support so vim colorscheme are not changed.
# We also start tmux with the -u option to show all the characteres.
alias tmux="tmux -2 -u"

# Activate Python virtual environment.
. ~/venv/bin/activate

