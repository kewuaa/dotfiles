try_add_to_path() {
    local dir="$1"
    local mode="${2:-prepend}"

    if [ ! -d "$dir" ]; then
        # echo "Warning: Directory '$dir' does not exist, skipping." >&2
        return 1
    fi

    if [[ ":$PATH:" == *":$dir:"* ]]; then
        # echo "Info: '$dir' already in PATH, skipping." >&2
        return 0
    fi

    case "$mode" in
        prepend)
            PATH="$dir:$PATH"
            ;;
        append)
            PATH="$PATH:$dir"
            ;;
        *)
            echo "Error: Invalid mode '$mode'. Use 'prepend' or 'append'." >&2
            return 1
            ;;
    esac

    export PATH
    # echo "Added '$dir' to PATH ($mode)." >&2
}

# config for locale
export LANG=en_US.UTF-8

# config default editor
export EDITOR=nvim

export CPM_SOURCE_CACHE=~/.cache/CPM

try_add_to_path $HOME/TexLive/bin/x86_64-linux
try_add_to_path $HOME/gemini/node_modules/.bin
try_add_to_path $HOME/.zvm/self
try_add_to_path $HOME/.zvm/bin
try_add_to_path $HOME/.local/bin

# load cargo environment
test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"
