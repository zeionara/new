#!/bin/bash

export NEW_ROOT="$HOME/new"

new () {
    type="$1"
    name="$2"
    description="$3"

    type_root="$NEW_ROOT/$type"

    if [ -d "$type_root" ]; then
        echo "Creating new $type project..."
        $type_root/new.sh "$name" "$description"
    else
        echo "Can't create project - project type '$type' is unknown"
        return
    fi
}

wen () {
    type="$1"
    name="$2"

    type_root="$NEW_ROOT/$type"

    if [ -d "$type_root" ]; then
        echo "Removing existing $type project..."
        $type_root/wen.sh "$name"
    else
        echo "Can't remove project - project type '$type' is unknown"
        return
    fi
}
