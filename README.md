# Kubernetes Context Watcher 🚀🔍

## Description 📝

Kubernetes Context Watcher is an open-source project designed to help engineers avoid accidental operations on production clusters. It changes the background color of your terminal based on the Kubernetes context you're currently using. This visual cue acts as a reminder, ensuring you're aware when you're operating in a production environment.

## How it Works 🛠️

The project includes a set of scripts that interact with your Kubernetes configuration and iTerm2 terminal settings. When you switch your Kubernetes context, the scripts check if the new context is one of your specified "alert" contexts (like production). If it is, the script changes the iTerm2 background color to red. If not, it resets the background color to your default.

## Installation 📥

1. Clone the Kubernetes Context Watcher repository to your local machine.
2. Navigate to the cloned directory.
3. Run the `install.sh` script. This script will:
   - Check if `kubectl` is installed. If not, you'll be prompted to install it first.
   - Copy the `change_background.sh` script to your home directory and make it executable.
   - Get the list of Kubernetes contexts.
   - Prompt you to enter the contexts you want to use, separated by spaces.
   - Add the selected contexts to the main script.
   - Append the script content to your `.zshrc` file.
4. Restart your shell to apply the changes.

## Usage 🚀

Once installed, the script will automatically run every time you switch your Kubernetes context using the `kubectl config use-context` command. If you switch to a context that you've specified as an "alert" context, your iTerm2 background color will change to red.

## Contribute 🤝

We welcome contributions from the community. Feel free to submit issues, feature requests, and pull requests!

## License 📄

This project is open-source and is licensed under the MIT License.

## Safety First! ⚠️🔒

Remember, with great power comes great responsibility. Always double-check your Kubernetes context before performing operations, especially in production environments!
