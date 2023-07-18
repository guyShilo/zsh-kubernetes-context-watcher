#!/bin/bash

# Check if kubectl is installed
if ! command -v kubectl &>/dev/null; then
    echo "kubectl is not installed. Please install it and try again."
    exit 1
fi

cp change_background.sh ~/change_background.sh
# Make the script executable
chmod +x ~/change_background.sh

# Get the list of Kubernetes contexts
contexts=$(kubectl config get-contexts -o name)

# Prompt the user to select their contexts
echo "Please enter the contexts you want to use, separated by spaces:"
echo "Available contexts: $contexts"
read user_contexts

# Add the selected contexts to the main script
for context in $user_contexts; do
    sed -i '' -e "/# END_CONTEXTS/a\\
contexts+=(\"$context\")" ~/change_background.sh
done

script_content='
k8s_context_watcher_default_background_color="000000"

export K8S_CONTEXT_WATCHER_USER_DEFAULT_BACKGROUND_COLOR="010B17"

if [ -n "$K8S_CONTEXT_WATCHER_USER_DEFAULT_BACKGROUND_COLOR" ]; then
    k8s_context_watcher_default_background_color="$K8S_CONTEXT_WATCHER_USER_DEFAULT_BACKGROUND_COLOR"
fi

kubectl() {
    # Call the actual kubectl command with the provided arguments
    /usr/local/bin/kubectl "$@"

    local command=$(echo "$1" | awk "{print \$1}")
    # Run your background script before executing the kubectl command
    if [ "$command" = "config" ] && [[ "$2" == *"use-context"* ]]; then
        bash ~/change_background.sh $k8s_context_watcher_default_background_color
    fi
}
'

# Append the script content to the zshrc file
echo "$script_content" >>~/.zshrc

echo "Installation complete. Please restart your shell."
