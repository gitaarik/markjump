export MARKPATH=$HOME/.marks
mkdir -p "$MARKPATH"

function jump { 
    cd -P "$MARKPATH/$1" 2> /dev/null || echo "No such mark: $1"
}

function mark { 
    ln -s "$(pwd)" "$MARKPATH/$1"
}

function unmark { 
    rm "$MARKPATH/$1" 2> /dev/null || echo "No such mark: $1"
}

function marks {
    ls -l "$MARKPATH" | tail -n +2 | awk '{ print $(NF -2), $(NF -1), $(NF) }'
}
