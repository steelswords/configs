#################################
# To be run from the receiving linux box first:
# netcat -l -p 5000 | mplayer -fps 60 -cache 2048 -

#################################
# To be run from the streaming rpi:
# raspivid -t 0 -w 1280 -h 720 -o - | nc <linuxboxipaddr> 5000
#################################

# Source: https://dantheiotman.com/2017/08/23/using-raspivid-for-low-latency-pi-zero-w-video-streaming/
