export USE_CCACHE=1
continue=0

while [ $continue -eq "0" ]; do
	echo "Select device: 
	ancora
	ancora_tmo
	s2ve
	s2vep"
	read device
	if [ "$device" = "ancora" ] || [ "$device" = "ancora_tmo" ] || [ "$device" = "s2ve" ] || [ "$device" = "s2vep" ] ; then 
		continue=1
	else
		echo "Wrong input!"
	fi
done

. build/envsetup.sh
brunch "$device"
