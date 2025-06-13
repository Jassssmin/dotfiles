#!/bin/bash



timedisp() {
	local count=$1
	local mindisp=$((count / 60))
	local secdisp=$((count % 60 ))
	if ((secdisp <= 9 )); then
		echo "$mindisp:0$secdisp"
	else
		echo "$mindisp:$secdisp"
	fi
}

endprint() {
	timeend=$(($(date +%M)+($(date +%H)*60)))
	echo ""
	echo "Total work count: $workcount"
	echo "Total break count: $breakcount"
	echo "Time Start: $(timedisp $timestart)"
	echo "Time End: $(timedisp $timeend)"
	echo "Time Elapsed: $(timedisp $((timeend-timestart)))"
}

trap 'endprint; exit' SIGINT

workcount=0
breakcount=0
timestart=$(($(date +%M)+($(date +%H)*60)))
minute=60
breaktime=5
worktime=20
if (($# == 2)); then
	breaktime=$1;
	worktime=$2;
else
	if (($# == 1)); then
		breaktime=$((5*$1))
		worktime=$((20*$1))
	fi
fi



work=true
countdown=$(($worktime*minute))

notify-send "GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK GO TO WORK " -u critical
while true; do
	clear
	time=$(timedisp $countdown)
	if $work; then
		echo "Work $time"
	else
		echo "Break $time"
	fi
	((countdown--))
	if (($countdown <= 0)); then
		if $work; then
			work=false
			countdown=$(($breaktime*minute))
			notify-send "BBREAK TIME BREAK TIME BREAK TIME BREAK TIME BREAK TIME BREAK TIME BREAK TIME BREAK TIME BREAK TIME BREAK TIME BREAK TIME BREAK TIME BREAK TIME " -u critical
			((workcount++))
		else
			work=true
			countdown=$(($worktime*minute))
			notify-send "GO BACK TO WORK GO BACK TO WORK GO BACK TO WORK GO BACK TO WORK GO BACK TO WORK GO BACK TO WORK GO BACK TO WORK GO BACK TO WORK GO BACK TO WORK GO BACK TO WORK " -u critical
			((breakcount++))
		fi
	fi	
	sleep 1
done
