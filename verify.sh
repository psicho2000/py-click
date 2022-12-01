#!/usr/bin/env bash

# FIXME: replace the following with poetry run
# https://python-poetry.org/docs/basic-usage/

cyan=$(tput setaf 37)    # info
reset=$(tput sgr0)

echo "${cyan}Installing (dev) dependencies...${reset}"
pip install --requirement requirements.txt

echo "${cyan}Sorting imports...${reset}"
fdfind --exclude env \
       --exclude '.env' \
       --exclude venv \
       --exclude '.venv' \
       py \
      | xargs isort

echo "${cyan}Removing unused imports...${reset}"
autoflake --in-place \
          --remove-all-unused-imports \
          --recursive \
          --exclude '.git,.idea,.pytest_cache,.vscode,env,.env,venv,.venv' .

echo "${cyan}Formatting the code...${reset}"
black --line-length 130 \
      --exclude '/(.git|\.idea|.pytest_cache|.vscode|__pycache__|env|.env|venv|.venv)/' \
      .

echo "${cyan}Executing tests...${reset}"
python3 -m unittest
