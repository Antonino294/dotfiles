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

abbr wt "curl 'it.wttr.in/~Solano Inferiore'"

#abbr work "./Build-Folder/genact-linux"

#abbr sx "vim ~/.config/sxhkd/sxhkdrc"

abbr wtr "curl 'it.wttr.in/~Solano Inferiore' | lolcat -t -a -s 75"

abbr phone "adb connect 192.168.1.177"

abbr scrcpy "scrcpy -b2M -m800 --shortcut-mod lctrl,rctrl"

abbr wal "wal --backend colorz "

abbr wthr "curl 'it.wttr.in/~Solano Inferiore?tqp0'"

abbr cam "ffmpeg -stream_loop -1 -re -i output.mkv  -f v4l2 -vcodec rawvideo -pix_fmt yuv420p /dev/video0"

abbr cam2 "ffmpeg -i /dev/videoX -vcodec rawvideo -pix_fmt yuyv422 -vsync 0 -map 0:v -f v4l2 /dev/video0"

abbr cam3 "ffmpeg -loop 1 -re -i image.jpeg  -f v4l2 -vcodec rawvideo -pix_fmt yuv420p /dev/video0"

abbr ilossh "ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 Administrator@192.168.1.11"

abbr getcompose "rsync -auP -e 'ssh -p 44619' antonino@192.168.1.192:docker-compose.yml /home/antonino/Build-Folder/docker-compose.yml"

abbr getmine "rsync -auvrP -e 'ssh -p 44619' antonino@192.168.1.192:Minecraft/ /home/antonino/Build-Folder/minecraft-backup/"

abbr syncmusic "rsync -auvrP -e 'ssh -p 44619' /home/antonino/Musica/* antonino@192.168.1.192:/home/antonino/Musica/"

abbr syncfoto "rsync -auvrP -e 'ssh -p 44619' /home/antonino/Immagini/Importante/* /media/antonino/eb4a5748-a9c9-4896-a22e-e99ed5794954/home/antonino/Backup/Immagini/"

abbr srvr "ssh antonino@192.168.1.192"

abbr pix "wget --referer='https://pixiv.net' "

# aliases

alias burp "java --illegal-access=permit -noverify -javaagent:'$HOME/Build-Folder/Burp Suite Pro/burploader.jar' -jar '$HOME/Build-Folder/Burp Suite Pro/burpsuite_pro_v2021.8.4.jar' 2>/dev/null"

alias clack "export DISPLAY=:0 && xdotool key --window 'Minecraft\* 1.15.2 - Singleplayer' Escape mousedown --window 'Minecraft\* 1.15.2 - Singleplayer' 3"

alias cleck "export DISPLAY=:0 && xdotool key --window 'Minecraft\* 1.15.2 - Singleplayer' click --repeat 999999 --delay 600 --window 'Minecraft\* 1.15.2 - Singleplayer' 1"

#alias kb "cd ~/Build-Folder/Apps/ && ./OpenRGB_0.3_64_308bb6f9.AppImage --server & &&  ./Keyboard_Visualizer-x86_64.AppImage"

alias kb "~/Build-Folder/Apps/Keyboard_Visualizer-x86_64.AppImage"

#alias deemix 'python3 /home/antonino/Build-Folder/deemix/server.py'

alias deezer 'export DISPLAY=:0 && python3 /home/antonino/Build-Folder/deemix-pyweb/deemix-pyweb.py'

#alias upd 'curl "https://ddns.pboehm.de/update/lenovob590/9c0e5dd33c00bad665b40c49429bd461d01f3423"'

#alias gotop "ytop"

alias gotop "btm --battery -cgl"

alias btop "bpytop"

alias cava "env TERM=xterm-256color cava"

#alias mpv "devour mpv"

#alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias config 'dotbare'

#alias sxiv "devour sxiv"

alias b "bolt --fzf-search"

alias nnn "env TERM=xterm-256color nnn"

#alias glava 'glava --desktop &>/dev/null'

alias dotbare '/home/antonino/.dotbare/dotbare'

alias icat "kitty +kitten icat"

#alias ls "exa"

alias clipstudio "wine /home/antonino/.wine/drive_c/Program\ Files/CELSYS/CLIP\ STUDIO\ 1.5/CLIP\ STUDIO\ PAINT/CLIPStudioPaint.exe"
#alias ls "ls -Isnap"

#alias ambient "color=(kcolorchooser --print) $HOME/Build-Folder/polychromatic/polychromatic-cli -d all -e static --rgb \#$color"

alias youtube-dl "yt-dlp"

alias less "less -S"

alias tickrs "tickrs -pxs XMR-EUR,GME,AMC,PLTR,SLV,BB,AG,TSLA,BTC-USD,ETH-USD"

alias rand16 "head -c 512 /dev/urandom | base64 | head -c 20 | tr -d \[:punct:\] ; echo"

alias rand32 "head -c 1024 /dev/urandom | base64 | shuf | head -c 64 | tr -d \[:punct:\] | shuf --random-source=(find "$HOME"/Immagini/Landscapes -type f | shuf -n 1)"

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

#echo -n (set_color e5c07b --bold )(prompt_pwd) (set_color e06c75)'❯'(set_color e5c07b)'❯'(set_color 61afef)'❯ '

echo -n (set_color FFAF5F --bold )(prompt_pwd) (set_color D75F5F)'❯'(set_color FFAF5F)'❯'(set_color 5F5FFF)'❯ '

# e06c75 - e5c07b - 61afef

end

# Paths

set -gx PATH $PATH /home/antonino/.local/bin
set -gx PATH $PATH /usr/local/bin
set -gx PATH $PATH /usr/sbin/
set -gx PATH $PATH /home/antonino/.cargo/bin
set -gx PATH $PATH /usr/java/jre1.8.0_251/bin
set -gx PATH $PATH /home/antonino/.local/kitty.app/bin/
set -gx PATH $PATH /usr/local/lib/nodejs/node-v12.18.1-linux-x64/bin/
set -gx PATH $PATH /home/antonino/.gdrive-downloader/bin/
set -gx PATH $PATH /home/antonino/Build-Folder/jdk-14.0.2+12-jre/bin/
set -gx PATH $PATH /home/antonino/.nexustools/

set -gx EDITOR nvim

export NNN_OPTS="adeox"
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='K:kdeconnect;P:preview-tui'

export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"
export GCM_CREDENTIAL_STORE="cache"

# wal thing (no need with kitty)
#cat ~/.cache/wal/sequences &

zoxide init fish | source

#thefuck --alias  | source
