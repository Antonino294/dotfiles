#!/usr/bin/env sh

hc() {
    herbstclient "$@"
}

hc chain \
    . remove \
    . remove \
    . remove \
    . remove \
    . remove \
    . remove \
    . remove \
    . remove \

hc chain \
    . split left 0.25 \
    . focus right \
    . split right 0.67 \
    . focus right \
    . split bottom \
    . focus left \
    . focus left \
    . split bottom
