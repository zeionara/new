#!/bin/bash

name="$1"
description="$2"

if [ -z "$name" ]; then
    echo "Can't create project - project name is required"
    exit 1
fi

if [ -d "$name" ]; then
    echo "Can't create project - folder '$name' already exists"
    exit 1
fi

new_root="$NEW_ROOT/python"

# Create required files

mkdir "$name"

cp "$new_root/.pylintrc" "$name"
cp "$new_root/.flake8" "$name"
cp "$new_root/README.md" "$name"
cp "$new_root/LICENSE" "$name"
cp "$new_root/.gitignore" "$name"

cp "$new_root/nvim.lua" "$HOME/.config/nvim/projects/$name.lua"

sed -i "s/<<name>>/$name/g" "$name/README.md"
sed -i "s/<<description>>/$description/g" "$name/README.md"

mkdir "$name/$name"

touch "$name/$name/__init__.py"
cp "$new_root/__main__.py" "$name/$name"

mkdir "$name/assets"

# Create conda environment

. "$HOME/anaconda3/etc/profile.d/conda.sh"

export CONDA_ALWAYS_YES='true'

conda create -n "$name" python=3.11
conda activate "$name"

conda install -y click python-lsp-server

unset CONDA_ALWAYS_YES

# Initialize git

pushd "$name"

git init

popd

# Print status

echo
echo "Successfully created project $name"
echo 'To use it run the following commands:'
echo
echo conda activate $name
echo cd $name
echo python -m $name run foo/bar.txt
echo
echo The module must echo the provided path
