#!/bin/bash -x
declare -A singlet

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

