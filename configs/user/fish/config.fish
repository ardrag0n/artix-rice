 if status is-login
     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
         export LIBSEAT_BACKEND=logind
         exec dbus-run-session Hyprland &> /dev/null
     end
 end
if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# Created by `pipx` on 2023-04-25 08:38:06
set PATH $PATH /home/ar0177417/.local/bin /home/ar0177417/.local/bin/Custom
