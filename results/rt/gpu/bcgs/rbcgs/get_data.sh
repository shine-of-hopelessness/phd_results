#!/bin/bash

#grep "ExecutionTime" 1_4.out | tail -n1 | awk '{print $3}'
#res=0
#grep "ExecutionTime" $1 | head -n1 | awk '{res -= $3}'
#grep "ExecutionTime" $1 | tail -n1 | awk '{res += $3}'
#echo $res
for f in *.out; do
	echo $f
	grep "exec time" $f | tail -n1 | awk '{print $4}'
	grep "comm time" $f | tail -n1 | awk '{print $4}'
	grep "ExecutionTime" $f | sed -e 1b -e '$!d' | awk 'NR>1{print $3-p} {p=$3}'
done
