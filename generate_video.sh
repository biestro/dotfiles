#!/bin/zsh
ffmpeg -framerate $1 -pattern_type glob -i "*.$2" -c:v libx264 -pix_fmt yuv420p -y $3
