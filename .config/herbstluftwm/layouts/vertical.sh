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
    . split left 0.30 \
    . focus right \
    . split right 0.56 \
    . focus left
