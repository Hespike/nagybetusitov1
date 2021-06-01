#!/bin/bash

# Írj szkriptet, amely az összes .txt kiterjesztéső fájl nevét nagybetűsíti, de a kiterjesztést nem változtatja
# pl.:	file.txt -> FILE.txt	/ mivel .txt
#		file -> file			/ mivel nem .txt

# V1 - egrep hasznalataval:

for param in $(ls) ; do		# minden allomanyt megvizsgalunk
	nev=`echo $param | egrep -e ".txt" | cut -d '.' -f 1`	# egrep-pel megnezzuk, hogy txt-e, majd levagjuk csak a nevet
	if [ ! -s $nev ] ; then	# amennyiben a $nev valtozo tartalma nem ures, tehat valoban txt fajlrol van szo (ugyanis akar mappa is lehetne a $p)
		ujnev=`echo $nev | tr a-z A-Z`.txt	# fogjuk es nagybetusitjuk illetve utana tesszuk a txt kiterjesztest
		mv $param $ujnev	# feluliras
	fi
done
