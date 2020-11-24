#!/usr/bin/fish

if ps -C cmus > /dev/null

set  stat (cmus-remote -Q |
        grep --text 'status' |
        sed 's/status //')

set artist (cmus-remote -Q |
    grep --text '^tag artist' |
    sed '/^tag artistsort/d' |
    awk '{gsub("tag artist ", "");print}')

set title (cmus-remote -Q  |
    grep --text '^tag title' |
    sed -e 's/tag title //' |
    awk '{gsub("tag title ", "");print}')

set album (cmus-remote -Q  |
    grep --text '^tag album ' |
    awk '{gsub("tag album ", "");print}')

switch $stat
        case playing
                 echo "$title ▶ $album"
        case paused
                 echo "$title ‖ $album"
        case stopped
                echo "$title ■ $album"
end

end
