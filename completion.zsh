#compdef -n _snote snote
compdef -n '_files -g "*.md" -W ~/Documents/notes/' snote

function _snote {
    local -a subcmds
    subcmds=(':journal or files' 'week:make notes for week' 'last-week:notes from last week')
    _describe 'command' subcmds

}
