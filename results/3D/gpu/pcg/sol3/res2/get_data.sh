#!/bin/bash
for f in *.out
do
	echo $f
	echo $(grep "iters" $f | wc -l)
	iters=$(grep "iters" $f | awk '{sum += $2} END {print sum}')
	total_time=$(grep "iters" $f | awk '{tm += $4}END{print tm}')	
	echo $iters
	echo $total_time
	echo $(bc <<< "scale=6;$total_time/$iters")
done
