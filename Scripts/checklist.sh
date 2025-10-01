#!/bin/bash

# Configuration
BASE_DIR="$HOME/Documents/Notes/checklists"
DMENU_OPTS=(-i -l 1000)  # Options as array
THEME=(-fn "Fira Code-17" -nb "#1d2021" -nf "#ebdbb2" -sb "#176786" -sf "#ebdbb2")

init_base_dir() {
    [[ ! -d "$BASE_DIR" ]] && mkdir -p "$BASE_DIR"
}

show_main_menu() {
    ls "$BASE_DIR" | dmenu "${DMENU_OPTS[@]}" "${THEME[@]}"
}

show_items_menu() {
    local file="$1"
    cat "$BASE_DIR/$file" | dmenu "${DMENU_OPTS[@]}" "${THEME[@]}"
}

process_item() {
    local file="$1"
    local item="$2"
    
    # Check if the item already exists in the list (exact match)
    if grep -qFx "$item" "$BASE_DIR/$file"; then
        # If item exists, remove it using sed (escaping slashes in item)
        sed -i "/^${item//\//\\/}$/d" "$BASE_DIR/$file"
        echo "Item removed: $item"
    else
        # If item does not end with a dot, add one for consistency
        [[ "${item: -1}" != "." ]] && item="$item."
        # Add the new item to the list
        echo "$item" >> "$BASE_DIR/$file"
        echo "Item added: $item"
    fi
}

create_list() {
    local file="$1"
    # If filename does not end with .txt, append it
    [[ "$file" != *".txt" ]] && file="$file.txt"
    touch "$BASE_DIR/$file"
    echo "List created: $file"
}

main() {
    init_base_dir
    
    while true; do
        file=$(show_main_menu)
        [[ -z "$file" ]] && break
        
        # Special operations
        if [[ "$file" == *" --remove" ]]; then
            # If the selected option ends with " --remove", delete the file
            local file="${file% --remove}"
            rm "$BASE_DIR/$file"

            echo "List deleted: $file"
            
            continue

        elif [[ "$file" == *" --rename "* ]]; then
            # If the selected option matches the rename pattern, extract old and new names
            local old_name="${file%% --rename *}"
            local new_name="${file#* --rename }"

            mv "$BASE_DIR/$old_name" "$BASE_DIR/$new_name.txt"

            echo "List renamed: $old_name → $new_name.txt"

            continue

        fi
        
        # Check if list exists
        if [[ -f "$BASE_DIR/$file" ]]; then
            echo "List opened: $file"
            
            while true; do
                item=$(show_items_menu "$file")
                [[ -z "$item" ]] && break
                process_item "$file" "$item"
            done
            
        else
            create_list "$file"
        fi
    done
}

main
