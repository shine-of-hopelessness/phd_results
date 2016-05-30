#!/bin/bash
for f in *.out
do
	echo $f
	echo $(grep "DICPCG" $f | wc -l)
	iters=$(grep "DICPCG" $f | awk '{sum += $15} END {print sum}')
	total_time=$(grep "Total solver" $f | awk '{tm += $5}END{print tm}')	
	echo $iters
	echo $total_time
	echo $(bc <<< "scale=6;$total_time/$iters")
done
