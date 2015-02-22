#!/bin/sh

in=`curl https://www.polleverywhere.com/mvanleeuwen -s | grep 'user: new User(' | sed 's/user: new User(\(.*\)),/\1/' | jq '.current_poll.multiple_choice_poll.permalink, [.current_poll.multiple_choice_poll.options[]|.id][1]' -r`
path=`echo $in | tr ' ' '\n' | head -1`
choice=`echo $in | tr ' ' '\n' | tail -1`
url="https://www.polleverywhere.com/multiple_choice_polls/$path/options/$choice/results.json"

echo $url

while [ 1 ];
do
    curl -X POST -i $url &
    sleep 0.2
done
