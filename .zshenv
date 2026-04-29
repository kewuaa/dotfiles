# config for locale
export LANG=en_US.UTF-8

# config default editor
export EDITOR=nvim

export CPM_SOURCE_CACHE=~/.cache/CPM

case ":${PATH}:" in
    *:"$HOME/TexLive/bin/x86_64-linux":*)
        ;;
    *)
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="$HOME/TexLive/bin/x86_64-linux:$PATH"
        ;;
esac

# load cargo environment
test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"

# config zvm PATH
if [[ -d "$HOME/.zvm" ]]; then
    case ":${PATH}:" in
        *:"$HOME/.zvm/bin":*)
            ;;
        *)
            # Prepending path in case a system-installed rustc needs to be overridden
            export PATH="$HOME/.zvm/bin:$HOME/.zvm/self:$PATH"
            ;;
    esac
fi

case ":${PATH}:" in
    *:"$HOME/.local/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="$HOME/.local/bin:$PATH"
        ;;
esac
