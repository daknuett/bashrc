#!/bin/bash

if git branch --show-current &> /dev/zero
then 
    echo "✶ $(git branch --show-current)"
else
    echo "⤫"
fi
