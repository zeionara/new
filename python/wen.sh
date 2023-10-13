#!/bin/bash

name="$1"

if [ -z "$name" ]; then
    echo "Can't remove project - project name is required"
    exit 1
fi

if [ ! -d "$name" ]; then
    echo "Can't remove project - folder '$name' does not exists"
    exit 1
fi

# Delete project files

rm -rf "$name"

nvim_config_path="$HOME/.config/nvim/projects/$name.lua"

if [ -f "$nvim_config_path" ]; then
    rm "$nvim_config_path"
else
    echo 'No neovim config, nothing to delete'
fi

# Delete conda environment

. "$HOME/anaconda3/etc/profile.d/conda.sh"

export CONDA_ALWAYS_YES='true'

conda deactivate
conda remove -y -n "$name" --all || echo "No conda environment '$name', nothing to delete"

unset CONDA_ALWAYS_YES

# Print status

echo
echo "Successfully removed project $name"
