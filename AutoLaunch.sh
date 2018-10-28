#!/bin/bash
COUNTER=1
while(true) do
./SASAN.sh
curl "https://api.telegram.org/bot#token/sendmessage" -F "chat_id=67369633" -F "text=#NEWCRASH-#bot reloaded-${COUNTER}-times"
let COUNTER=COUNTER+1 
done
