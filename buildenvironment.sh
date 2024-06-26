#!/bin/bash

# This is a Bash script that builds the StoryWeaver dev environment.

# Authors: Alexandru Ungureanu
# Creation Date: 21-10-2023

set -e  # Exit immediately if a command exits with a non-zero status

# Function to clone or pull the latest changes from a Git repository
clone_or_pull() {
  local repo_url=$1
  local branch=$2
  local dir_name=$3

  if [ -d "$dir_name" ]; then
    echo "$dir_name folder exists. Pulling the latest changes."
    cd "$dir_name"
    git pull origin "$branch" || { echo "Failed to pull latest changes for $dir_name"; exit 1; }
    cd ..
  else
    echo "Cloning $dir_name from $repo_url"
    git clone -b "$branch" "$repo_url" "$dir_name" || { echo "Failed to clone $repo_url"; exit 1; }
    chmod -R 777 "$dir_name"
fi
}

# Define repository URLs and branch
FRONTEND_REPO="git@github.com:u-alexandru/StoryWeaver_V2_Frontend.git"
BACKEND_REPO="git@github.com:u-alexandru/StoryWeaver_V2_Backend.git"
BRANCH="develop"

# Clone or update the repositories
clone_or_pull "$FRONTEND_REPO" "$BRANCH" "StoryWeaver_V2_Frontend"
clone_or_pull "$BACKEND_REPO" "$BRANCH" "StoryWeaver_V2_Backend"

# Run Docker Compose commands
echo "Stopping any running containers..."
docker-compose down || { echo "Failed to stop containers"; exit 1; }

echo "Starting containers..."
docker-compose up -d || { echo "Failed to start containers"; exit 1; }

echo "Setup complete!"
