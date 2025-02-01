#!/bin/bash

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# ASCII Art Header
ascii_art="
${CYAN}
 ███████╗██╗  ██╗ ██████╗ ██╗  ██╗██████╗ 
██╔════╝╚██╗██╔╝██╔═══██╗╚██╗██╔╝██╔══██╗
█████╗   ╚███╔╝ ██║   ██║ ╚███╔╝ ██║  ██║
██╔══╝   ██╔██╗ ██║   ██║ ██╔██╗ ██║  ██║
███████╗██╔╝ ██╗╚██████╔╝██╔╝ ██╗██████╔╝
╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ 
                                                 
                                                                                             
                                                                                              
${NC}
"

# Function to display messages with colors
echo_message() {
    echo -e "${MAGENTA}$1${NC}"
}

echo -e "${CYAN}$ascii_art${NC}"

# Prompt to install node
echo_message "🚀 Do you want to install Node? (yes/no) 🛠️"
read answer

if [ "$answer" != "yes" ]; then
    echo_message "❌ Installation aborted. 💀"
    exit 0
fi

echo_message "⚙️ Installing Node... 🌐"

# Clone repository and install node dependencies
git clone https://github.com/achul123/skyportd
cd skyportd || { echo_message "❌ Failed to enter directory skyportd"; exit 1; }

echo_message "🔧 Installing dependencies... 📥"
npm install

# Install and update PM2
echo_message "🔧 Installing and updating PM2... ⚡"
npm install pm2 -g && pm2 update

echo_message "✅ Node, dependencies, and PM2 installed successfully! 🎉"
