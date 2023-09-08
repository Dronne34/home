# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dell/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/dell/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dell/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/dell/.fzf/shell/key-bindings.bash"
