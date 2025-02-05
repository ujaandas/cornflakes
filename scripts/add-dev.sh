#!/bin/bash

# Set cwd and script dir
PROJECT_DIR=$(pwd)
SCRIPT_DIR=$(dirname "$0")

# Check if flake.nix already exists
if [ -f "$PROJECT_DIR/flake.nix" ]; then
  echo "flake.nix already exists in the project directory. Aborting."
  exit 1
fi

# Copy default shell.nix
cp $SCRIPT_DIR/templates/dev.nix $PROJECT_DIR/flake.nix

# Set up direnv
echo 'use flake' > $PROJECT_DIR/.envrc && direnv allow

# OK
echo "Setup completed successfully."
