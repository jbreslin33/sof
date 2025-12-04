#!/bin/bash
#
# Gemini CLI Installation Script for Debian/Ubuntu Systems
# This script installs necessary Python prerequisites, creates a virtual
# environment, and installs the Google GenAI CLI package.

# --- 1. Install Prerequisites ---
echo "--- Step 1: Installing Prerequisites (Requires sudo) ---"
sudo apt update
sudo apt install python3 python3-pip python3-venv -y

# Check if apt installation was successful
if [ $? -ne 0 ]; then
    echo "Error installing Debian prerequisites. Please check your internet connection or package list."
    exit 1
fi

# --- 2. Create and Install in Virtual Environment ---
VENV_NAME="gemini-env"
echo "--- Step 2: Creating virtual environment '$VENV_NAME' ---"

# Create the virtual environment
python3 -m venv $VENV_NAME

# Check if venv creation was successful
if [ ! -d "$VENV_NAME" ]; then
    echo "Error: Virtual environment creation failed."
    exit 1
fi

echo "--- Step 3: Installing Gemini CLI into the environment ---"
# Install the package using the pip inside the newly created environment
./$VENV_NAME/bin/pip install google-genai

# --- 3. Final Instructions ---
echo ""
echo "=========================================================="
echo "✨ Gemini CLI Installation Complete! ✨"
echo "=========================================================="
echo "To begin using the tool, you must now manually run the following commands:"
echo ""
echo "1. ACTIVATE the environment (This command modifies your current shell):"
echo "   source ./$VENV_NAME/bin/activate"
echo ""
echo "2. SET YOUR API KEY (Replace YOUR_API_KEY_HERE):"
echo '   export GEMINI_API_KEY="YOUR_API_KEY_HERE"'
echo ""
echo "3. Verify installation:"
echo "   gemini --version"
echo ""
echo "When you are finished, run 'deactivate' to exit the environment."
echo "=========================================================="

source ./gemini-env/bin/activate
export $1
gemini --version
sudo snap install gemini

