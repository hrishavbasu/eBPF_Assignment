#!/bin/bash

echo "Setting up LLVM..."

# Add LLVM to PATH
echo 'export PATH="/opt/homebrew/opt/llvm/bin:$PATH"' >> ~/.zshrc

# Set LDFLAGS and CPPFLAGS
echo 'export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"' >> ~/.zshrc
echo 'export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"' >> ~/.zshrc

# Source the updated .zshrc
source ~/.zshrc

echo "LLVM setup complete. Please restart your terminal or run 'source ~/.zshrc' to apply the changes."

# Verify the setup
echo "Verifying LLVM setup..."
if command -v llvm-config &> /dev/null
then
    echo "LLVM is now properly set up:"
    llvm-config --version
    echo "LLVM location: $(which llvm-config)"
else
    echo "LLVM setup failed. Please check your installation and try again."
fi

