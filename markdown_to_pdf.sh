#!/bin/bash

# Function to check if the user has root privileges
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "This script requires root privileges to install packages."
        exit 1
    fi
}

# Check if Pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "Pandoc is not installed. Attempting to install..."

    # Check package manager and install Pandoc
    if command -v apt &> /dev/null; then
        check_root
        apt update
        apt install -y pandoc
    elif command -v yum &> /dev/null; then
        check_root
        yum install -y pandoc
    elif command -v dnf &> /dev/null; then
        check_root
        dnf install -y pandoc
    elif command -v pacman &> /dev/null; then
        check_root
        pacman -Syu --needed --noconfirm pandoc
    else
        echo "Package manager not found. Please manually install Pandoc and run this script again."
        exit 1
    fi
fi

# Check if pdflatex is installed
if ! command -v pdflatex &> /dev/null; then
    echo "pdflatex not found. Attempting to install necessary LaTeX packages..."

    # Check package manager and install LaTeX packages
    if command -v apt &> /dev/null; then
        check_root
        apt update
        apt install -y texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra
    elif command -v yum &> /dev/null; then
        check_root
        yum install -y texlive-scheme-basic texlive-collection-fontsrecommended texlive-collection-latexrecommended
    elif command -v dnf &> /dev/null; then
        check_root
        dnf install -y texlive-scheme-basic texlive-collection-fontsrecommended texlive-collection-latexrecommended
    elif command -v pacman &> /dev/null; then
        check_root
        pacman -Syu --needed --noconfirm texlive-core texlive-fontsextra texlive-latexextra
    else
        echo "Package manager not found. Please manually install pdflatex and the necessary LaTeX packages and run this script again."
        exit 1
    fi
fi

read -p "Enter the Markdown file name (including extension): " markdown_file

# Check if the Markdown file exists
if [ ! -f "$markdown_file" ]; then
    echo "Markdown file not found!"
    exit 1
fi

# Convert Markdown to PDF using Pandoc
output_file="${markdown_file%.*}.pdf"
pandoc "$markdown_file" -o "$output_file"

# Check if PDF conversion was successful
if [ $? -eq 0 ]; then
  echo "Conversion complete. PDF saved as: $output_file"

  # Change ownership of the output file to the user running the script
  sudo chown $(whoami) "$output_file"
else
  echo "Conversion failed!"
fi

