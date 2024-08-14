#!/bin/bash

# Check if LLVM is installed
if ! command -v llvm-config &> /dev/null
then
    echo "LLVM is not installed. Please install it using Homebrew:"
    echo "brew install llvm"
    exit 1
fi

# Add LLVM to PATH
echo 'export PATH="/opt/homebrew/opt/llvm/bin:$PATH"' >> ~/.zshrc

# Set LDFLAGS and CPPFLAGS
echo 'export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"' >> ~/.zshrc
echo 'export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"' >> ~/.zshrc

# Source the updated .zshrc
source ~/.zshrc

echo "LLVM setup complete. Please restart your terminal or run 'source ~/.zshrc' to apply the changes."

# Check if Rust is installed
if ! command -v rustc &> /dev/null
then
    echo "Rust is not installed. Would you like to install it now? (y/n)"
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    else
        echo "Please install Rust manually and run this script again."
        exit 1
    fi
fi

echo "Setup complete. You're now ready to develop the eBPF project on macOS."
echo "Remember to use a Linux VM or container for compiling and running the eBPF program."
