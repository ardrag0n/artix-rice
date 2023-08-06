. /usr/share/autojump/autojump.fish
#. ~/.profile
# Set the default editor
set -x EDITOR nvim
set -x VISUAL nvim
# alias pico 'edit'
# alias spico 'sedit'
# alias nano 'edit'
# alias snano 'sedit'
alias vim 'nvim'


# Color for manpages in less makes manpages a little easier to read
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")


# EXTRACT

function extract -a file
    if test -f "$file"
        switch "$file"
            case "*.tar.bz2"
                tar xjf $file
            case "*.tar.gz"
                tar xzf $file
            case "*.bz2"
                bunzip2 $file
            case "*.rar"
                unrar x $file
            case "*.gz"
                gunzip $file
            case "*.tar"
                tar xf $file
            case "*.tbz2"
                tar xjf $file
            case "*.tgz"
                tar xzf $file
            case "*.zip"
                unzip $file
            case "*.Z"
                uncompress $file
            case "*.7z"
                7z x $file
            case "*"
                echo '$file' cannot be extracted via extract()
        end
    else
        echo "'$file' is not a valid file"
    end
end

function ftext
	grep -iIHrn --color=always "$argv[1]" . | less -r
end

function cpp
    set -e
    strace -q -ewrite cp -- "$argv[1]" "$argv[2]" 2>&1 \
    | awk '{
        count += $NF
        if (count % 10 == 0) {
            percent = count / total_size * 100
            printf "%3d%% [", percent
            for (i=0;i<=percent;i++)
                printf "="
                printf ">"
                for (i=percent;i<100;i++)
                    printf " "
                    printf "]\r"
                }
            }
    END { print "" }' total_size="(stat -c '%s' "$argv[1]")" count=0
end

# Copy and go to the directory
function cpg
    if test -d "$argv[2]"
        cp "$argv[1]" "$argv[2]" && cd "$argv[2]"
    else
        cp "$argv[1]" "$argv[2]"
    end
end

# Move and go to the directory
function mvg
    if test -d "$argv[2]"
        mv "$argv[1]" "$argv[2]" && cd "$argv[2]"
    else
        mv "$argv[1]" "$argv[2]"
    end
end

# Create and go to the directory
function mkdirg
    mkdir -p "$argv[1]"
    cd "$argv[1]"
end

# Goes up a specified number of directories  (i.e. up 4)
function up
    set -l d ""
    set -l limit $argv[1]
    for i in (seq 1 $limit)
        set d $d/..
    end
    set d (echo $d | sed 's/^\///')
    if test -z "$d"
        set d ..
    end
    cd $d
end


# Returns the last 2 fields of the working directory
function pwdtail
    pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
end


# GitHub Titus Additions

function gcom
    git add .
    git commit -m "$argv[1]"
end

function lazyg
    git add .
    git commit -m "$argv[1]"
    git push
end
