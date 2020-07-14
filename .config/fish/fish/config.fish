#Set Greeting to nothing

set fish_greeting ""

#Abbreviations

abbr IP "dig +short myip.opendns.com @resolver1.opendns.com | lolcat -a -t"

abbr upG "pkcon update"

abbr upD "pkcon refresh"

#abbr upd 'curl "https://ddns.pboehm.de/update/lenovob590/9c0e5dd33c00bad665b40c49429bd461d01f3423"'

abbr lotto "shuf -i 1-90 -n 5 | lolcat -a -t"

abbr graphic "export DISPLAY=:0"

abbr vis "glava --desktop"

abbr jf-start "sudo systemctl start jellyfin.service"

abbr jf-stop "sudo systemctl stop jellyfin.service"

abbr jf-restart "sudo systemctl restart jellyfin.service"

abbr wt "curl 'wttr.in/~Solano+Inferiore?lang=it'"

abbr work "./Build-Folder/genact-linux"

abbr sx "vim ~/.config/sxhkd/sxhkdrc"

abbr wtr "curl 'wttr.in/~Solano+Inferiore?lang=it' | cat | lolcat -t -a -s 75"

#

# aliases

alias config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias clack "export DISPLAY=:0 && xdotool key --window 'Minecraft\* 1.15.2 - Singleplayer' Escape mousedown --window 'Minecraft\* 1.15.2 - Singleplayer' 3"

alias cleck "export DISPLAY=:0 && xdotool key --window 'Minecraft\* 1.15.2 - Singleplayer' click --repeat 999999 --delay 600 --window 'Minecraft\* 1.15.2 - Singleplayer' 1"

alias kb "/home/antonino/Build-Folder/OpenRGB/OpenRGB & /home/antonino/Build-Folder/KeyboardVisualizer/KeyboardVisualizer"

alias deemix 'python3 /home/antonino/Build-Folder/deemix/server.py'

abbr upd 'curl "https://ddns.pboehm.de/update/lenovob590/9c0e5dd33c00bad665b40c49429bd461d01f3423"'

alias gotop "ytop"

alias cava "env TERM=xterm-256color cava"

#alias manr "find /usr/share/man/man1/ -type f | awk -F '/' '{ print $6 }' | sed 's/.1.gz//g' | shuf | head -1 | xargs man"

#Fisher Workaround
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

#Colors

set fish_color_normal 305d87 

set fish_color_autosuggestion d65d0e

set fish_color_param 4c8bd3

set fish_color_command 36648f 

set fish_color_comment 3b9d7c --bold

set fish_color_error ff5500 --bold

set fish_color_end ffaa00

set fish_color_escape d2a700 --bold

set fish_color_operator cc241d

#set fish_color_search_match d2a700 

set fish_color_match fb3333 --bold

set fish_color_redirection d2a700

set fish_color_quote cc241d --bold

set fish_color_cancel fe8019 --bold

# Prompt

function fish_prompt 

echo -n (set_color e5c07b --bold )(prompt_pwd) (set_color e06c75)'❯'(set_color e5c07b)'❯'(set_color 61afef)'❯ ' 

end

# Paths

set -gx PATH $PATH /home/antonino/.local/bin 
set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /home/antonino/.cargo/bin
set -gx EDITOR nvim

# wal thing (no need with kitty)
#cat ~/.cache/wal/sequences &  

zoxide init fish | source
