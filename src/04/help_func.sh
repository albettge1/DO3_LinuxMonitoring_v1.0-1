#!/bin/bash

source .conf


background_color() {
	case $1 in
		1) echo -e '\033[107m';; # white
		2) echo -e '\033[41m';; # red
		3) echo -e '\033[42m';; # green
		4) echo -e '\033[44m';; # blue
		5) echo -e '\033[45m';; # purple
		6) echo -e '\033[40m';; # black
	esac
}

font_color() {
	case $1 in
		1) echo '\033[97m';; # white
		2) echo '\033[31m';; # red
		3) echo '\033[32m';; # green
		4) echo '\033[34m';; # blue
		5) echo '\033[35m';; # purple
		6) echo '\033[30m';; # black
	esac
}

set_color[0]=$column1_background
set_color[1]=$column1_font_color
set_color[2]=$column2_background
set_color[3]=$column2_font_color

default_color[0]=3
default_color[1]=6
default_color[2]=3
default_color[3]=6



