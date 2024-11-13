# Logcraft

This tool helps you automatically generate a daily work log in markdown format based on Git commit history. You can customize the log content, including completed tasks, ongoing tasks, and to-dos.

## Features

- Automatically generates a daily work log with information such as:
  - Completed tasks
  - Ongoing tasks
  - To-dos
- Pulls commit history from Git to populate the "Completed" section.
- Customizable via prompts for Git branch names and log content.
- Saves logs in a specified directory (default: `~/Desktop/worklog`).
- Supports user-friendly markdown formatting with bullet points for tasks.

## Installation

### 1. Clone the repository or download the script files.

Ensure you have Git installed on your system.

```bash
git clone https://github.com/henry-wu-1130/logcraft.git
cd logcraft
```

### 2. Install dependencies (if any).

This tool may require additional tools such as git to fetch commit data. Ensure Git is installed.

### 3. (Optional) Add the script to /usr/local/bin for easy access.

To make the tool accessible from anywhere, you can create a symbolic link:

```bash
sudo ln -s logcraft/index.sh /usr/local/bin/logcraft
```

After creating the symlink, you can run the tool by typing logcraft in the terminal.

## Usage

### Step 1: Run the Work Log Generator Script

You can generate the work log by running the following command:

```bash
logcraft
```

The script will prompt you for:

- Source branch: The Git branch where you want to start the log.
- Target branch: The Git branch where you want to end the log (e.g., the branch where you've completed tasks).

### Step 2: Answer the Prompts

The script will prompt you for:

- A description of completed tasks (fetched from Git commit history).
- Ongoing tasks that you're currently working on.
- To-dos that are yet to be addressed.

You can enter the information manually, and the script will format it into a neat markdown log.

### Step 3: View Your Work Log

After the script generates the log, the file will be saved in the ~/Desktop/worklog directory with the name of the current date (e.g., 2024/11/13.md).

## Example Output

```markdown
# 2024/11/13 - 前端

## ✅ Completed Tasks

- 18d3a8d 2024/11/12, 18:37:43 henry-wu-1130 feat: 完成新功能！
- 6896796 2024/11/12, 11:16:11 henry-wu-1130 chore: 升級套件版本
- bdc27fa 2024/11/08, 18:33:41 henry-wu-1130 fix: 修正錯誤

## 🔄 Ongoing Tasks

-

## 📌 To-Do

---

📅 Created on 2024-11-13 11:11:26
👤 Author: Henry Wu
```

## Customization

You can modify the script to suit your needs, including:

- Changing the log file location.
- Customizing the output format of the commit messages.
- Adding additional sections to the log (e.g., meetings, notes).

## Requirements

- Git (to fetch commit data)
- Bash shell or compatible terminal

## Troubleshooting

If the script doesn't work as expected, make sure:

- You are in a Git repository when running the script.
- The Git repository contains the necessary commit history for the source and target branches.

## Contributing

Feel free to fork the repository and submit issues or pull requests if you find any bugs or want to add new features.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
