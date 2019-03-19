#!/bin/bash
# A Basic Test example Script to distribute ravencoin assets
# With some mempool checking to prevent 'overflows' of the mempool 'buffer'

# Author: push, (Adam Bull, Ravenland.org)
# Date: 19/03/2019

# ASSET TO DISTRIBUTE
ASSET="CAKE"

# AMOUNT OF ASSET TO DISTRIBUTE PER ADDRESS
AMOUNT="10"


cat << "EOF"
${red}


                                                 ,::::.._
                                               ,':::::::::.
                                           _,-'`:::,::(o)::`-,.._
                                        _.', ', `:::::::::;'-..__`.
                                   _.-'' ' ,' ,' ,\:::,'::-`'''
                               _.-'' , ' , ,'  ' ,' `:::/
                         _..-'' , ' , ' ,' , ,' ',' '/::
                 _...:::'`-..'_, ' , ,'  , ' ,'' , ,'::|
              _`.:::::,':::::,'::`-:..'_',_'_,'..-'::,'|
      _..-:::'::,':::::::,':::,':,'::,':::,'::::::,':::;
        `':,'::::::,:,':::::::::::::::::':::,'::_:::,'/
        __..:'::,':::::::--''' `-:,':,':::'::-' ,':::/
   _.::::::,:::.-''-`-`..'_,'. ,',  , ' , ,'  ', `','
 ,::SSt:''''`                 \:. . ,' '  ,',' '_,'
                               ``::._,'_'_,',.-'
                                   \\ \\
                                    \\_\\
                                     \\`-`.-'_
                                  .`-.\\__`. ``
                                     ``-.-._
                                         `

        8b,dPPYba, ,adPPYYba, 8b       d8  ,adPPYba, 8b,dPPYba,
        88P'   "Y8 ""     `Y8 `8b     d8' a8P_____88 88P'   `"8a
        88         ,adPPPPP88  `8b   d8'  8PP""""""" 88       88  LAND
        88         88,    ,88   `8b,d8'   "8b,   ,aa 88       88  COIN
        88         `"8bbdP"Y8     "8"      `"Ybbd8"' 88       88  SECURITY ISSUE


EOF



while read p; do

# SOMETIMES THE RAVEND PROCESS DIES OR RPC IS NOT ALIVE SO
# ADD PROCESS CHECK
# ADD RPC CHECK HERE
mempoolsize=$(raven-cli getmempoolinfo  | grep size | awk '{print $2}' | sed 's/,//g')

# function may not work if RPC is down.

# Check mempoolsize is returning numeric number
re='^[0-9]+$'
if ! [[ $mempoolsize =~ $re ]] ; then
	# if not number throw a critical error, remember last address before error and exit dist program
   echo "error: $mempoolsize was not a number. Halting distribution with critical error. Last distributed address was $p" >&2; exit 1;
fi


if [ "$mempoolsize" -gt "150" ]; then
echo "mempoolsize exceeded 150, delaying 20 seconds. Current mempoolsize: $mempoolsize"
sleep 20
# give some time for ravend to catchup mempool
else
echo "mempoolsize ok at value.. $mempoolsize .. now continuing.."

echo "issuing command transfer $ASSET $AMOUNT $p"
raven-cli transfer "$ASSET" "$AMOUNT" "$p"
fi
done < sample-addresses.txt

