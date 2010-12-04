bindkey ^R history-incremental-search-backward
setopt correct

autoload predict-on
zle -N predict-on
zle -N predict-off
bindkey ^Z   predict-on
bindkey ^X^Z predict-off
zstyle ':predict' verbose true
