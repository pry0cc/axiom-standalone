#!/bin/bash

start="$(date +%s)"

vagrant destroy -f
vagrant up
rm package.box
vagrant package
vagrant box add -f package.box --name axiom-local
vagrant destroy -f

end="$(date +%s)"

seconds="$(expr $end - $start)"
time=""

if [[ "$seconds" -gt 59 ]]
then
	minutes=$(expr $seconds / 60)
	time="$minutes minutes"
else
	time="$seconds seconds"
fi

echo "Image built and saved in $time" | notify -silent
