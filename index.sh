#!/bin/bash

# Note:
# - This script must be run within a Git project directory; otherwise, commit logs cannot be retrieved.
# - The script will create and store the work log file in the $HOME/worklog directory.
# - Users can specify the source and target branch names through prompts.

# List all local branches and prompt user input
echo "📋 Available branches:"
git branch --format="%(refname:short)"

# Prompt the user to input the source and target branches
read -p "Enter the source branch (e.g., main): " SOURCE_BRANCH
read -p "Enter the target branch (e.g., dev): " TARGET_BRANCH

# Set the work log directory
WORKLOG_DIR="$HOME/Desktop/Worklog"

# Check if the directory exists; if not, create it
mkdir -p "$WORKLOG_DIR"

# Get the current date
DATE=$(date +"%Y/%m/%d")
FILENAME="$(date +"%Y-%m-%d")-work-log.md"
FILEPATH="$WORKLOG_DIR/$FILENAME"

# Check if the file already exists
if [ -f "$FILEPATH" ]; then
    # Ask user if they want to overwrite the file
    echo "⚠️ File $FILEPATH already exists."
    read -p "Do you want to overwrite it? (yes/no): " OVERWRITE_CHOICE

    # If user chooses no, exit the script
    if [[ "$OVERWRITE_CHOICE" != "yes" ]]; then
        echo "❌ File not overwritten. Exiting."
        exit 1
    fi
fi

# Retrieve Git log and format each line with "- " to follow Markdown bullet format
COMPLETED_TASKS=$(git log --pretty=format:'%h %cd %an %s' --date=format:'%Y/%m/%d, %H:%M:%S' --no-merges "$SOURCE_BRANCH..$TARGET_BRANCH" | sed 's/^/- /')

# If no commits are found, indicate no completed tasks
if [ -z "$COMPLETED_TASKS" ]; then
    COMPLETED_TASKS="- No completed tasks from $SOURCE_BRANCH to $TARGET_BRANCH."
fi

# Create the Markdown file with the template
cat << EOF > "$FILEPATH"
# $DATE - 前端

## ✅ Completed Tasks
$COMPLETED_TASKS 

## 🔄 Ongoing Tasks
-  

## 📌 To-Do
-  

---

📅 Created on $(date +"%Y-%m-%d %H:%M:%S")
👤 Author: Henry Wu
EOF

# Completion message
echo "📝 Work log file $FILEPATH created successfully!"

# Prompt user to open the file
echo "Choose an option to open the file:"
echo "1) Open with VS Code (if installed)"
echo "2) Open with default macOS app"
echo "3) Open with nano (terminal editor)"
echo "4) Open with vim (terminal editor)"
read -p "Enter your choice (1/2/3/4): " OPEN_CHOICE

# Open the file based on user's choice
case "$OPEN_CHOICE" in
    1)
        # Try to open with VS Code
        if command -v code &> /dev/null; then
            code "$FILEPATH"
        else
            echo "⚠️ VS Code is not installed. Trying another option."
            open "$FILEPATH"
        fi
        ;;
    2)
        # Open with macOS default application
        open "$FILEPATH"
        ;;
    3)
        # Open with nano
        nano "$FILEPATH"
        ;;
    4)
        # Open with vim
        vim "$FILEPATH"
        ;;
    *)
        echo "❌ Invalid choice. Exiting."
        exit 1
        ;;
esac
