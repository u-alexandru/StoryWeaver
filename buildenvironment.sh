#!/bin/bash
# This is a Bash script that builds the StoryWeaver dev environment.

# Authors: Alexandru Ungureanu
# Creation Date: 21-10-2023

# clone develop branch from git@github.com:u-alexandru/StoryWeaver_Frontend.git
# if Frontend folder exists then update it
# else clone it
if [ -d "StoryWeaver_V2_Frontend" ]; then
    echo "StoryWeaver_V2_Frontend folder exists"
else
    git clone -b develop git@github.com:u-alexandru/StoryWeaver_V2_Frontend.git
    chmod -R 777 StoryWeaver_V2_Frontend
fi

if [ -d "StoryWeaver_V2_Backend" ]; then
    echo "StoryWeaver_V2_Backend folder exists"
else
  echo "Cloning StoryWeaver_V2_Backend"
    git clone -b develop git@github.com:u-alexandru/StoryWeaver_V2_Backend.git
    chmod -R 777 StoryWeaver_V2_Backend
fi

# run docker compose
docker-compose down

docker-compose up