# config for locale
export LANG=en_US.UTF-8

# config default editor
export EDITOR=nvim

# config proxy
export proxy_port=20172
export all_proxy=http://127.0.0.1:$proxy_port
export http_proxy=http://127.0.0.1:$proxy_port
export https_proxy=http://127.0.0.1:$proxy_port
export no_proxy=localhost,127.0.0.1,::1

# config fpc environment
export FPCDIR=/usr/lib/fpc/src
export FPCTARGET=Linux
export FPCTARGETCPU=x86_64
export LAZARUSDIR=/usr/lib/lazarus
export PP=/usr/bin/fpc

# config for flutter mirrors
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# config python virtual environment dir
export PYVENV=~/Python/venvs

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
