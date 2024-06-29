# Dotfiles
This repository contains all of my configuration files and QOL scripts that make me happy. Many of these config files and scripts are minimal but they add up and have made my workflow enjoyable.

## Contents
- Neovim: Text Editor (BTW), configuration files. Built from "scatch". A lot of structural and plugin inspiration from LazyVim and Primeagen's neovimrc.
- i3: Window Manager that I use for quick navigation between workspaces.
- Alacritty: Terminal Emulator. 
- Scripts:
    - debinstall: automates and handles the installation process of .deb files.
    - networkadmin: opens up orbi admin login url.
    - projects: uses fzf to list all git repositories and allows me to cd into that dir.
    - tmmux: a simple cli tmux manager script that lets me easily see all Tmux sessions. Create, kill, attach, and detach from Tmux sessions.
    - dotfiles: automation script that goes around my computer to update my most recent files for this my Dotfiles repository, then opens lazygit.
    - pullrocketbooks: automated sorting script that sorts my rocket-book notes into their respective directories.
    - openrocketbooks: uses fzf to allow me to search for a topic in my notes then opens that files directory with feh.
    - darkcompiler: automated compiling and running script of Java, C, C++, and Assembly. Script was written with the intention of simplifying the compiling process for any language as needed. I also added a bunch of prompts to customize running the program. The script also clones the project into a temporary directory and runs the program in there. The user is then prompted on whether they want to copy the contents into the original directory and whether to keep or delete the temporary directory. This results in an easy way to keep compiling and running programs in a clean manner.
    - ccp/ccd/cmv: uses fzf to allow me to search for a directory. Depending on the command. ccp and cmv take file arguments that allow users to cp or mv files by using fzf. ccd allows me to use fzf to cd into another directory without having to remember the path. This is the most helpful and most used script I use on a daily basis. (ccd script is written as a function in my .zshrc file)
    - cgpg: manager for gpg encryption. Currently only have it setup for my passwords and github tokens but only on my own computer. I will turn this into a bigger project later. 
    - mp4converter: uses file/filepath arguments to attempt conversion to mp4.
    - asmconvert: converts file/filepath argument to assembly. Currently only supports Java, C++, C, and Python.
    - javadoc_parser: python webscraping script that prompts for a Javadocs URL. Parses out the functions and their descriptions and saves it to a txt file.
    - libreconverter: python script that works in tandum my Neovim autocmds.lua LibreConvert function. It converts a .txt file that I am working on in Neovim, formats it into a .docx file. Then finally converts into a pdf.
    - live_server: python script that also works together with my Neovim autocmds.lua LiveServer function. It takes an html file I am currently working on and opens a local python server with that file opened up. Allowing for quick viewing of the changes to an HTML file.
