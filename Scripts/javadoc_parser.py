#!/usr/bin/env python3

# ======================================================================================================
# Javadoc Parser Script: Parses out the data from Javadoc pages. Works in tandum with Neovim Autocommand
# that allows the user to call this script but also save the file to a directory where I keep all parsed
# class javadocs.
# ======================================================================================================

import requests
from bs4 import BeautifulSoup
import textwrap
import os
import sys


def fetch_java_api(url):
    response = requests.get(url)
    if response.status_code != 200:
        print("Failed to fetch the URL")
        return None
    return response.text


def parse_class_name(soup):
    title_element = soup.select_one("title")
    if title_element:
        title_text = title_element.get_text(strip=True)
        class_name = title_text.split()[0]  # Extract the first word
        return class_name
    return "Methods"


def parse_methods(html_content):
    soup = BeautifulSoup(html_content, 'html.parser')
    method_details = soup.select("li.blockList > ul.blockList > li.blockList")
    methods = []

    for method_detail in method_details:
        method_signature_element = method_detail.select_one("pre")
        method_description_element = method_detail.select_one("div.block")
        if method_signature_element:
            method_signature = method_signature_element.get_text(strip=True)
            method_description = method_description_element.get_text(
                strip=True) if method_description_element else "No description available."
            methods.append((method_signature, method_description))

    class_name = parse_class_name(soup)
    return methods, class_name


def format_description(description):
    wrapped_text = textwrap.fill(
        description, width=80, subsequent_indent=' ' * 5)
    comment_lines = wrapped_text.split('\n')
    commented_description = "\n".join(
        [f"     {line.strip()}" for line in comment_lines])
    return commented_description


def write_methods_to_file(methods, class_name):
    target_dir = "/home/dark/Documents/Notebooks/Java/Java-Docs"
    os.makedirs(target_dir, exist_ok=True)
    filename = f"{class_name}.txt"
    filepath = os.path.join(target_dir, filename)
    with open(filepath, 'w') as file:
        for method, description in methods:
            file.write(f"{method}\n")
            formatted_description = format_description(description)
            file.write(f"{formatted_description}\n\n")
    print(f"Methods written to {filepath}")


def main():
    if len(sys.argv) != 2:
        print("Usage: fetch_java_methods.py <URL>")
        sys.exit(1)

    url = sys.argv[1]

    html_content = fetch_java_api(url)
    if html_content:
        methods, class_name = parse_methods(html_content)
        write_methods_to_file(methods, class_name)


if __name__ == "__main__":
    main()
