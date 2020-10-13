#!/bin/bash -x
declare -A singlet
declare -A dic0

#FOR SINGLET
function flipCoin() {
        n=$1
        for (( i=0; i<$n; i++ ))
        do
        for (( j=0; j<20; j++ ))
        do
                random1=$((RANDOM%2))

                if [ $n -eq 1 ]
                then
                        if [ $random1 -eq 0 ]
                        then
                singlet["$j"]="Head |"
                        ((hcount++))
                        else
                singlet["$j"]="Tail |"
                        ((tcount++))
                        fi
                fi
	done
	done
}
flipCoin 1

echo "SINGLET:::" ${singlet[@]}

#PERCENTAGE

dic0[H]=$hcount
dic0[T]=$tcount
echo ${dic0[@]}
echo ${!dic0[@]}
perh=`echo $hcount | awk '{print ($1/20)*100}'`
echo "the HEAD percentage is $perh%"
arr[j]=$perh
((j++))
pert=`echo $tcount | awk '{print ($1/20)*100}'`
echo "the TAIL percentage is $pert%"
arr[j]=$pert
((j++))
