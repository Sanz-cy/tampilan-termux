#!/data/data/com.termux/files/usr/bin/bash
# EL-piXer Termux Visual Customizer (No Menu)
# GitHub: [Your-Repo-Link]

# ==============================================
# INSTRUCTIONS:
# 1. Copy this entire script to Termux
# 2. Run: bash <filename>
# 3. Restart Termux
# ==============================================

apply_visuals() {
    clear
    echo -e "\e[1;33m"
    echo "   _____ _      _____ ___ _  ___  _____ "
    echo "  | ____| |    |  ___|_ _| |/ _ \| ____|"
    echo "  |  _| | |    | |_   | || | | | |  _|  "
    echo "  | |___| |___ |  _|  | || | |_| | |___ "
    echo "  |_____|_____||_|   |___|_|\___/|_____|"
    echo -e "\e[0m"
    echo -e "\e[1;36mInstalling Visual Theme...\e[0m"

    # Install minimal dependencies
    pkg install -y git figlet toilet lolcat ncurses-utils

    # Create config directory
    mkdir -p ~/.termux
    mkdir -p ~/.elpixer

    # termux.properties (color scheme)
    cat > ~/.termux/termux.properties << 'EOL'
# EL-piXer Visual Scheme
use-fullscreen = true
color-0 = 1A1A1A
color-1 = FF5555
color-2 = 55FF55
color-3 = FFFF55
color-4 = 5555FF
color-5 = FF55FF
color-6 = 55FFFF
color-7 = E6E6E6
color-8 = 4D4D4D
color-9 = FF6E67
color-10 = 5FF967
color-11 = FFFB67
color-12 = 6A76FB
color-13 = FF77FF
color-14 = 5FFDFF
color-15 = FFFFFF
background = 000000
foreground = FFFFFF
EOL

    # bashrc (pure visual)
    cat > ~/.bashrc << 'EOL'
#!/data/data/com.termux/files/usr/bin/bash

# Clear screen
clear

# EL-piXer Banner (Yellow)
function show_banner() {
    echo -e "\e[1;33m"
    figlet -f slant "EL-piXer" | lolcat --force
    echo -e "\e[1;36m$(date +'%A, %d %B %Y %H:%M:%S')\e[0m"
    echo -e "\e[1;35m$(toilet -f term -F border 'Termux' | lolcat --force)\e[0m"
}

# Linux-style PS1 Prompt
function set_prompt() {
    PS1="\n\[\e[1;32m\]┌─[\[\e[1;34m\]\u\[\e[1;32m\]@\[\e[1;33m\]EL-piXer\[\e[1;32m\]]-[\[\e[1;37m\]\w\[\e[1;32m\]]\n└─[\[\e[1;31m\]\$\[\e[1;32m\]] \[\e[0m\]"
}

# Main execution
show_banner
set_prompt
EOL

    # Apply changes
    termux-reload-settings
    chmod +x ~/.bashrc

    echo -e "\e[1;32mInstallation Complete!\e[0m"
    echo -e "Restart Termux to see changes"
}

# Run installation
apply_visuals