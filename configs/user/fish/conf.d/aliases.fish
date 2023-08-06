# Web Commands
alias web='cd $web_location'
function hugo_create
	cd ~/website
	hugo new content/posts/2023/$argv[1].md
	nvim ~/website/content/posts/2023/$argv[1].md
end
function hugo_delete
	rm ~/website/content/posts/2023/$argv[1].md
end

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias vi='nvim'
alias svi='sudo nvim'
alias vis='nvim "+set si"'
alias pacman='sudo pacman'
alias wayland='--enable-features=UseOzonePlatform --ozone-platform=wayland'
alias reboot='loginctl reboot'
alias mmegasync='rclone mount MEGA: /mnt/MEGA/'
# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias github='cd ~/Github'
alias DATA='cd /mnt/DATA'
alias edit='nvim'
alias sedit='sudo nvim'
alias alert='notify-send --urgency=low -i "$([ $status = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Config Files
alias fish_config="nvim ~/.config/fish"
alias hypr_config='nvim ~/.config/hypr/hyprland.conf'
alias nvim_config='nvim ~/.config/nvim'

# cd into the old directory
alias bd 'cd $OLDPWD'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ls='ls -Fh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "
# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
function countfiles
    for t in files links directories
        echo (find . -type $t | wc -l) $t
    end
end 2>/dev/null


# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show open ports
alias openports='netstat -nape --inet'

# Aliases for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Aliases to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r | more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Aliases for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="find /var/log -type f -exec grep -Iq . {} \; -print0 | xargs -0 file --mime-type | grep 'text/' | cut -d':' -f1 | xargs tail -f"

# SHA1
alias sha1='openssl sha1'

# Misc
alias audio_fix='pactl set-sink-volume 43 85.76% 100%'
