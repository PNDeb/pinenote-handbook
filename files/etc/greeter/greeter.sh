#!/usr/bin/env sh

# we keep track of the number of time the greeter was opened via auto-start
count_file="$HOME/.config/pinenote/greeter_count"
# we do not start the greeter if this file exists
disable_file="$HOME/.config/pinenote/disable_greeter"

#
test -e "${count_file}" || echo 0 > "${count_file}"

content=`cat "${count_file}"`

echo "Content: ${content}"

if test "$content" -eq 0; then
	content=1;
	test -e "${disable_file}" && rm "${disable_file}"
	echo "${content}" > "${count_file}"
elif test "${content}" -eq 1; then
	content=2;
	test -e "${disable_file}" && rm "${disable_file}"
	echo "${content}" > "${count_file}"
elif test "${content}" -eq 2; then
	content=3;
	test -e "${disable_file}" && rm "${disable_file}"
	echo "${content}" > "${count_file}"
else
	echo "Greeter started enough times. Will not delete the disable file"
fi

# exit if the disable file exists
test -e "${disable_file}" && exit

# use gnome-help-based yelp to show the help page
yelp /etc/greeter/html/index.html&

# check for configuration directory
test -d $HOME/.config/pinenote || mkdir $HOME/.config/pinenote

# touching this file will prevent the help from being shown on next boot/login
touch "${disable_file}"

# this file should lead the Pinenote GNOME extension to disable the overview
disable_overview_file="$HOME/.config/pinenote/do_not_show_overview"
test -e ${disable_overview_file} && rm "${disable_overview_file}"
