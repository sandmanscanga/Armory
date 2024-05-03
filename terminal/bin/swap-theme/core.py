import argparse
import json
import os
import random


def check_oh_my_zsh_installed():
    zsh_path = os.getenv("ZSH")
    if zsh_path is None or not os.path.isdir(zsh_path):
        print("Oh My Zsh is not installed or ZSH variable is not set. Please install Oh My Zsh and retry.", file=sys.stderr)
        return False
    return True


def load_random_theme():
    zsh_path = os.getenv("ZSH")
    blacklist_path = os.path.join(os.path.expanduser('~'), '.zsh_theme_blacklist')
    
    # Ensure the blacklist file exists
    if not os.path.isfile(blacklist_path):
        open(blacklist_path, 'a').close()
    
    # List all .zsh-theme files and extract their names
    theme_paths = [os.path.join(zsh_path, "themes", theme) for theme in os.listdir(os.path.join(zsh_path, "themes")) if theme.endswith(".zsh-theme")]
    theme_names = [os.path.splitext(os.path.basename(theme))[0] for theme in theme_paths]
    
    # Load the blacklist into a list
    with open(blacklist_path, 'r') as file:
        blacklisted = file.read().splitlines()
    
    # Filter out blacklisted themes
    filtered_themes = [theme for theme in theme_names if theme not in blacklisted]
    
    # Check if any themes are left after filtering
    if not filtered_themes:
        print("All themes are blacklisted. Resetting blacklist.")
        open(blacklist_path, 'w').close()  # Clears the blacklist
        filtered_themes = theme_names  # Reset filtered_themes to all themes
    
    # if no filtered themes throw an exception
    if not filtered_themes:
        raise RuntimeError("No valid themes available to load.")

    # Safely select a random theme from filtered_themes
    random_theme = random.choice(filtered_themes)
    new_theme_path = os.path.join(zsh_path, 'themes', random_theme + '.zsh-theme')

    return {"name": random_theme, "path": new_theme_path}


def add_to_blacklist(theme):
    blacklist_path = os.path.join(os.path.expanduser('~'), '.zsh_theme_blacklist')
    with open(blacklist_path, 'a') as file:
        file.write(f"{theme}\n")
    print(f"Added {theme} to blacklist")


def main(cmdline):
    if check_oh_my_zsh_installed():
        if cmdline.blacklist:
            add_to_blacklist(cmdline.blacklist)
        else:
            theme_map = load_random_theme()
            print(json.dumps(theme_map, indent=2))


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-b",
        "--blacklist",
        type=str,
        help="specify theme to blacklist"
    )
    main(parser.parse_args())
