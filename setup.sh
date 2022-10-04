#!/bin/bash

# test if you already have the prompt
function not_here {
    b=$(cat $1 | grep https://github.com/Pompom9zZz/GitPrompt)
    if [ -z "$b" ]
    then
        here=0
    else
        here=1
    fi
}

function main {
    # search the .bashrc file
    bashrc=$(find $HOME -maxdepth 3 -name .bashrc)
    if [ -z $bashrc ] 
    then
        echo -e "❌  No such file .bashrc\n" >&2
        bashrc=$(find $HOME -maxdepth 3 -name .zshrc)
        if [ -z $bashrc ]
        then
            echo -e "❌  No such file .zshrc\n" >&2
            exit 1
        fi
    fi
    #verify you don't have this prompt
    not_here $bashrc
    if [[ $here -eq 1 ]]
    then
        echo -e "⚙️  You already have this prompt\n"
        exit 0
    fi
    # adding code at the end of bashrc
    cat bashrc.txt 1>> $bashrc
    echo -e " ✅  Done\n"
    bash
    exit 0
}

main