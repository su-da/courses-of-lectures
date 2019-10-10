#!/bin/sh

if [ -d $1 ] ; then
    if [ ! -e public/$1 ] ; then
        mkdir public/$1
    fi
    pandoc -s -t revealjs -p -H _layouts/header.html \
        --slide-level=2 --highlight-style=espresso \
        -c /css/slide.css \
        -V history \
        -V revealjs-url=/reveal.js \
        $1/index.md -o public/$1/index.html
    if [ -d $1/res ] ; then
        rsync -a --delete $1/res public/$1
    fi
    if [ -d $2 ] ; then
        rsync -a --delete public/$1 $2
    fi
fi
