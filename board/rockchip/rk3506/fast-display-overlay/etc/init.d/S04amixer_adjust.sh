#!/bin/sh
#
# amixer adjust for rk3506g demo evb
#


start() {
	amixer -c 0 sset 'MIC1 Boost' 4
	amixer -c 0 sset 'MIC2 Boost' 4
}

stop() {
	amixer -c 0 sset 'MIC1 Boost' 0
	amixer -c 0 sset 'MIC2 Boost' 0
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	*)
		echo "Usage: $0 {start|stop|restart}"
		exit 1
esac

exit $?
