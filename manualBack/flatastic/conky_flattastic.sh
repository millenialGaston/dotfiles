#!/bin/bash
sleep 20
conky -c ~/dotfiles/manualBack/flatastic/.conky/conky-ring/conkyrc_ring &
conky -c ~/dotfiles/manualBack/flatastic/.conky/conky-weather/conkyrc_weather &
conky -c ~/dotfiles/manualBack/flatastic/.conky/conky-calendar/conkyrc_calendar &
conky -c ~/dotfiles/manualBack/flatastic/.conky/conky-rss/conkyrc_rss_archlinux &
conky -c ~/dotfiles/manualBack/flatastic/.conky/conky-dash/conkyrc_dash_archlinux
exit 0
