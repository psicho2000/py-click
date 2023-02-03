#!/usr/bin/env bash

cyan=$(tput setaf 37)    # info
reset=$(tput sgr0)       # reset

echo "${cyan}Installing de-pen-de-ncies...${reset}"
poetry install

echo "${cyan}Sorting imports...${reset}"
fdfind --exclude '.venv' python3 | xargs isort

echo "${cyan}Removing unused imports...${reset}"
autoflake --in-place \
          --remove-all-unused-imports \
          --recursive \
          --exclude '.git,dist,.venv' .

echo "${cyan}Formatting the code...${reset}"
black --line-length 130 \
      --exclude '/(.git|dist|.venv)/' \
      .

echo "${cyan}Executing demons...${reset}"
pytest
