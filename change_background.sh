#!/bin/zsh
set -eu

# Initialize an empty array for contexts
contexts=()
# END_CONTEXTS

# Get the current Kubernetes context
current_context=$(kubectl config current-context) || {
    echo "Failed to get current Kubernetes context"
    exit 1
}

if [ ${#contexts[@]} -ne 0 ]; then
    context_found=false
    for context in "${contexts[@]}"; do
        if [ "$current_context" = "$context" ]; then
            context_found=true
            # Change the iTerm2 background color to red
            echo -e "\033]PhFF0000\033\\" || {
                echo "Failed to change iTerm2 background color"
                exit 1
            }
            break
        fi
    done
    if [ "$context_found" = false ]; then
        # Reset the iTerm2 background color to default
        echo -e "\033]Ph$1\033\\"
    fi
fi
