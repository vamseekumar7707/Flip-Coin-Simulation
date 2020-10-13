#!/bin/bash -x
declare -A singlet
declare -A dic0
declare -A doublet
declare -A dic
declare -A triplet
declare -A dic1


#FOR SINGLET
function flipCoin() {
        n=$1
        for (( i=0; i<$n; i++ ))
        do
        for (( j=0; j<20; j++ ))
        do
                random1=$((RANDOM%2))
		random2=$((RANDOM%2))
		random3=$((RANDOM%2))

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
#FOR TRIPLET

                      if [ $n -eq 3 ]
                then
                        if [ $random1 -eq 0 ] && [ $random2 -eq 0 ] && [ $random3 -eq 0 ]
                        then
                triplet["$j"]="Head Head Head |"
                        ((hhh++))
                        elif [ $random1 -eq 0 ] && [ $random2 -eq 0 ] && [ $random3 -eq 1 ]
                        then
                triplet["$j"]="Head Head Tail |"
                        ((hht++))
                        elif [ $random1 -eq 0 ] && [ $random2 -eq 1 ] && [ $random3 -eq 0 ]
                        then
                triplet["$j"]="Head Tail Head |"
                        ((hth++))
                        elif [ $random1 -eq 1 ] && [ $random2 -eq 0 ] && [ $random3 -eq 0 ]
                        then
                triplet["$j"]="Tail Head Head |"
                        ((thh++))
                        elif [ $random1 -eq 1 ] && [ $random2 -eq 1 ] && [ $random3 -eq 1 ]
                        then
                triplet["$j"]="Tail Tail Tail |"
                        ((ttt++))
                        elif [ $random1 -eq 1 ] && [ $random2 -eq 1 ] && [ $random3 -eq 0 ]
                        then
                triplet["$j"]="Tail Tail Head |"
                        ((tth++))
                        elif [ $random1 -eq 0 ] && [ $random2 -eq 1 ] && [ $random3 -eq 1 ]
                        then
                triplet["$j"]="Head Tail Tail |"
                        ((htt++))
                        elif [ $random1 -eq 1 ] && [ $random2 -eq 0 ] && [ $random3 -eq 1 ]
                        then
                triplet["$j"]="Tail Head Tail |"
                        ((tht++))
                        fi
                fi

	done
	done
}
for (( i=1; i<=3; i++ ))
do
flipCoin $i
done


echo "SINGLET:::" ${singlet[@]}

echo "DOUBLET:::" ${doublet[@]}

echo "TRIPLET:::" ${triplet[@]}

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

#TRIPLET_PERCENTAGE

dic1[HHH]=$hhh
dic1[HHT]=$hht
dic1[HTH]=$hth
dic1[HTT]=$htt
dic1[THH]=$thh
dic1[THT]=$tht
dic1[TTH]=$tth
dic1[TTT]=$ttt
echo ${dic1[@]}
echo ${!dic1[@]}
hhh=`echo $hhh | awk '{print ($1/20)*100}'`
echo "the HHH percentage is $hhh%"
arr[j]=$hhh
((j++))
hht=`echo $hht | awk '{print ($1/20)*100}'`
echo "the HHT percentage is $hht%"
arr[j]=$hht
((j++))
hth=`echo $hth | awk '{print ($1/20)*100}'`
echo "the HTH percentage is $hth%"
arr[j]=$hth
((j++))
htt=`echo $htt | awk '{print ($1/20)*100}'`
echo "the HTH percentage is $htt%"
arr[j]=$htt
((j++))
thh=`echo $thh | awk '{print ($1/20)*100}'`
echo "the THH percentage is $thh%"
arr[j]=$thh
((j++))
tht=`echo $tht | awk '{print ($1/20)*100}'`
echo "the THT percentage is $tht%"
arr[j]=$tht
((j++))
tth=`echo $tth | awk '{print ($1/20)*100}'`
echo "the TTH percentage is $tth%"
arr[j]=$tth
((j++))
ttt=`echo $ttt | awk '{print ($1/20)*100}'`
echo "the TTT percentage is $ttt%"
arr[j]=$ttt
((j++))

echo ${arr[@]}

