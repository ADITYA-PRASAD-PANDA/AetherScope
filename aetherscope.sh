while :
do
	memoryUsed=`free -m | head -2 | tail -1 | awk '{ print $3 }'`

	availableFreeMemory=`free -m | head -2 | tail -1 | awk '{ print $2}'`

	memoryCalculate=`expr $memoryUsed \* 100  / $availableFreeMemory`

	echo -e "`date +"%r %D"`\t$memoryCalculate" >> memoryReport.tsv
	
	
	if [[ $memoryCalculate -ge 85 ]]
	then
		echo "Memory Is Going To Exhaust" | espeak-ng
		exit
	fi
	
	sleep 500


done

