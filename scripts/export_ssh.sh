#!/usr/bin/env bash

#
# A generic script to export SSH keys
#

###################################################################################################
############################ MAIN LOGIC - DO NOT MODIFY BELOW #####################################
###################################################################################################

# Do not modify the below, there be dragons. Modify at your own risk.

# Store the current logged-in user
current_user=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ {print $3}')

# User home directory
user_home="/Users/$current_user"

# Check if the current user is valid (not root or setup user)
if [[ "$current_user" == "root" || "$current_user" == "_mbsetupuser" || -z "$current_user" ]]; then
    echo "Current user is not logged in or is a system user..."
    echo "Will try again later..."
    exit 0
fi

# Function to print SSH keys if found
print_ssh_keys() {
    local file=$1
    if [[ -e "$file" ]]; then
        echo "Found $file"
        ssh_keys=$(< "$file")
        echo "$ssh_keys"
    else
        echo "No SSH keys found in $file"
    fi
}

# Check for different types of SSH keys
if [[ -d "$user_home/.ssh" ]]; then
    echo "Checking for SSH keys in $user_home/.ssh directory..."

    # Check for RSA, Ed25519, and known_hosts files
    print_ssh_keys "$user_home/.ssh/id_rsa.pub"
    print_ssh_keys "$user_home/.ssh/id_ed25519.pub"
    print_ssh_keys "$user_home/.ssh/known_hosts"

else
    echo "No .ssh directory found for $current_user"
    exit 0
fi

exit 0
