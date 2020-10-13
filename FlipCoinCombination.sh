#!/bin/bash -x
declare -A singlet
declare -A dic0
declare -A doublet
declare -A dic

#FOR SINGLET
function flipCoin() {
        n=$1
        for (( i=0; i<$n; i++ ))
        do
        for (( j=0; j<20; j++ ))
        do
                random1=$((RANDOM%2))
		random2=$((RANDOM%2))

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
#FOR DOUBLET

                if [ $n -eq 2 ]
                then
                        if [ $random1 -eq 0 ] && [ $random2 -eq 0 ]
                        then
                doublet["$j"]="Head Head |"
                        ((headhead++))
                        elif [ $random1 -eq 0 ] && [ $random2 -eq 1 ]
                        then
                doublet["$j"]="Head Tail |"
                        ((headtail++))
                        elif [ $random1 -eq 1 ] && [ $random2 -eq 0 ]
                        then
                doublet["$j"]="Tail Head |"
                        ((tailhead++))
                        elif [ $random1 -eq 1 ] && [ $random2 -eq 1 ]
                        then
                doublet["$j"]="Tail Tail |"
                        ((tailtail++))
                        fi
                fi

	done
	done
}
for (( i=1; i<=2; i++ ))
do
flipCoin $i
done


echo "SINGLET:::" ${singlet[@]}

echo "DOUBLET:::" ${doublet[@]}

#SINGLET_PERCENTAGE

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

#DOUBLET_PERCENTAGE

dic[HT]=$headtail
dic[TT]=$tailtail
dic[TH]=$tailhead
dic[HH]=$headhead
echo ${dic[@]}
echo ${!dic[@]}
hper=`echo $headhead | awk '{print ($1/20)*100}'`
echo "the HH percentage is $hper%"
arr[j]=$hper
((j++))
tper=`echo $tailtail | awk '{print ($1/20)*100}'`
echo "the TT percentage is $tper%"
arr[j]=$tper
((j++))
thper=`echo $tailhead | awk '{print ($1/20)*100}'`
echo "the TH percentage is $thper%"
arr[j]=$thper
((j++))
htper=`echo $headtail | awk '{print ($1/20)*100}'`
echo "the HT percentage is $htper%"
arr[j]=$htper
((j++))

