# Markdown to PDF Converter

This script converts Markdown files to PDF using Pandoc.

## Prerequisites
* Linux operating system
* Bash shell
* Pandoc (Installation instructions provided below)

## Installation

1. Clone the repository or download the markdown_to_pdf.sh script:

> git clone https://github.com/bogdan54/markdown-to-pdf.git

2. Change into the cloned directory:

> cd markdown-to-pdf

3. Make the script executable:

> chmod +x markdown_to_pdf.sh

4. Install Pandoc (if not already installed):

* Ubuntu/Debian:
>sudo apt update sudo apt install -y pandoc texlive-latex-base texlive-
fonts-recommended texlive-fonts-extra texlive-latex-extra

* Fedora:
> sudo dnf install -y pandoc texlive-scheme-basic texlive-collection-
fontsrecommended texlive-collection-latexrecommended

* Arch Linux:
> sudo pacman -Syu –needed –noconfirm pandoc texlive-core texlive-
fontsextra texlive-latexextra

## Usage
1. Open a terminal and navigate to the directory containing the mark-
down_to_pdf.sh script.

2. Run the script:
> ./markdown_to_pdf.sh

3. Follow the on-screen prompts:
* Enter the name of the Markdown file you want to convert (including the
extension).
* The script will convert the Markdown file to PDF using Pandoc.
* Enter converted PDF file will be saved in the same directory as the
Markdown file.

## License
This project is licensed under the MIT License.

## Contributing
Contributions are welcome! If you find any issues or have suggestions for
improvement, please feel free to submit a pull request.

## Acknowledgements
* This script is inspired by the requirements of a Markdown to PDF conver-
sion workflow.
* Thanks to the contributors who helped improve this script.

## Contact
For any questions or feedback, please reach out to contact@bogdancapitanescu.xyz.

