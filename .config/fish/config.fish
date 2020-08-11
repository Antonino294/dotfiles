#Set Greeting to nothing

set fish_greeting ""

#Abbreviations

abbr IP "dig +short myip.opendns.com @resolver1.opendns.com | lolcat -a -t"

abbr upG "pkcon update"

abbr upD "pkcon refresh"

#abbr upd 'curl "https://ddns.pboehm.de/update/lenovob590/9c0e5dd33c00bad665b40c49429bd461d01f3423"'

abbr lotto "shuf -i 1-90 -n 5 | lolcat -a -t"

abbr graphic "export DISPLAY=:0"

abbr jf-start "sudo systemctl start jellyfin.service"

abbr jf-stop "sudo systemctl stop jellyfin.service"

abbr jf-restart "sudo systemctl restart jellyfin.service"

abbr wt "curl 'wttr.in/~Solano+Inferiore?lang=it'"

#abbr work "./Build-Folder/genact-linux"

#abbr sx "vim ~/.config/sxhkd/sxhkdrc"

abbr wtr "curl 'wttr.in/~Solano+Inferiore?lang=it' | lolcat -t -a -s 75"

abbr phone "adb connect 192.168.1.2"


# aliases

alias clack "export DISPLAY=:0 && xdotool key --window 'Minecraft\* 1.15.2 - Singleplayer' Escape mousedown --window 'Minecraft\* 1.15.2 - Singleplayer' 3"

alias cleck "export DISPLAY=:0 && xdotool key --window 'Minecraft\* 1.15.2 - Singleplayer' click --repeat 999999 --delay 600 --window 'Minecraft\* 1.15.2 - Singleplayer' 1"

alias kb "cd ~/Build-Folder/ && ./KeyboardVisualizer nrml_scl=1 nrml_ofst=0,08 bkgd_mode=0 frgd_mode=18 single_color_mode=11 avg_mode=0 anim_speed=250 -delay=10"

#alias deemix 'python3 /home/antonino/Build-Folder/deemix/server.py'

alias deezer 'export DISPLAY=:0 && /home/antonino/Build-Folder/startdeemix.sh'

alias upd 'curl "https://ddns.pboehm.de/update/lenovob590/9c0e5dd33c00bad665b40c49429bd461d01f3423"'

alias gotop "ytop"

alias cava "env TERM=xterm-256color cava"

alias mpv "devour mpv"

#alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias config 'dotbare'

#alias sxiv "devour sxiv"

alias b "bolt --fzf-search"

alias nnn "env TERM=xterm-256color nnn"

alias glava 'glava --desktop &>/dev/null'

alias dotbare '/home/antonino/.dotbare/dotbare'


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

set fish_color_search_match --background=1c1c1c

set fish_color_match fb3333 --bold

set fish_color_redirection d2a700

set fish_color_quote cc241d --bold

set fish_color_cancel fe8019 --bold

set fish_pager_color_progress a2a8ba --background=1c1c1c

# Prompt

function fish_prompt 

echo -n (set_color e5c07b --bold )(prompt_pwd) (set_color e06c75)'❯'(set_color e5c07b)'❯'(set_color 61afef)'❯ ' 

end


# stuff

#egrep "^export " ~/.profile | while read e
#	set var (echo $e | sed -E "s/^export ([A-Z_]+)=(.*)\$/\1/")
#	set value (echo $e | sed -E "s/^export ([A-Z_]+)=(.*)\$/\2/")
#	
#	# remove surrounding quotes if existing
#	set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")
#
#	if test $var = "PATH"
#		# replace ":" by spaces. this is how PATH looks for Fish
#		set value (echo $value | sed -E "s/:/ /g")
#	
#		# use eval because we need to expand the value
#		eval set -xg $var $value
#
#		continue
#	end
#
#	# evaluate variables. we can use eval because we most likely just used "$var"
#	set value (eval echo $value)
#
#	#echo "set -xg '$var' '$value' (via '$e')"
#	set -xg $var $value
#end

# Paths

set -gx PATH $PATH /home/antonino/.local/bin 
set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /home/antonino/.cargo/bin
set -gx PATH $PATH /usr/java/jre1.8.0_251/bin
set -gx PATH $PATH /home/antonino/.local/kitty.app/bin/
set -gx PATH $PATH /usr/local/lib/nodejs/node-v12.18.1-linux-x64/bin/
set -gx PATH $PATH /home/antonino/.gdrive-downloader/bin/

set -gx EDITOR nvim

export NNN_OPTS="adeox"
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='K:kdeconnect;P:preview-tabbed'

export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"

# wal thing (no need with kitty)
#cat ~/.cache/wal/sequences &  

zoxide init fish | source

#thefuck --alias  | source
