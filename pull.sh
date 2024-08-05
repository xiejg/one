#!/bin/bash

# Find all subdirectories that contain a .git directory
find . -type d -name ".git" | while read -r gitdir; do
    # Get the directory containing the .git directory
    repo_dir=$(dirname "$gitdir")
    
    echo "Pulling with rebase in $repo_dir"
    
    # Change to the repository directory
    cd "$repo_dir" || exit

    # Perform git pull --rebase
    git pull --rebase

    # Return to the original directory
    cd - > /dev/null || exit
done
