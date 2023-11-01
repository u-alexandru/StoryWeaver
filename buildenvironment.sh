#!/bin/bash
# This is a Bash script that builds the StoryWeaver dev environment.

# Authors: Alexandru Ungureanu
# Creation Date: 21-10-2023

# clone develop branch from git@github.com:u-alexandru/StoryWeaver_Frontend.git
# if Frontend folder exists then update it
# else clone it
if [ -d "StoryWeaver_Frontend" ]; then
    echo "StoryWeaver_Frontend folder exists"
else
    git clone -b develop git@github.com:u-alexandru/StoryWeaver_Frontend.git
    chmod -R 777 StoryWeaver_Frontend
fi

if [ -d "StoryWeaver_Backend_Laravel" ]; then
    echo "StoryWeaver_Backend_Laravel folder exists"
else
  echo "Cloning StoryWeaver_Backend_Laravel"
    git clone -b develop git@github.com:u-alexandru/StoryWeaver_Backend_Laravel.git
    chmod -R 777 StoryWeaver_Backend_Laravel
fi

# run docker compose
docker-compose down

docker-compose up