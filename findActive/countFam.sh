#!/bin/bash
##Script finds all families from censor map file, then counts how many of each family are in the familiy. 

wkDIR=/data/rc003/Brittany/censor/Mouse/All
InFile="mouseORF1ORF2min4kbmax8kb.fasta.map"

countFAM="numFamMouseAll.txt"
labelFAM="countMouseAll.txt"

cd ${wkDIR}

if [ -f ${countFAM} ]; then
	rm ${countFAM}
	touch ${countFAM}
    echo "${countFAM} exists, replacing"
else
    touch ${countFAM}
    echo "${countFAM} did not exist, now does" 
fi

if [ -f allFam.txt ]; then
	rm allFam.txt
	echo "allFam deleted"
fi

if [ -f ${labelFAM} ]; then
	rm ${labelFAM}
	echo "${labelFAM} deleted"
fi


echo "extracting families"
awk '{print $4}' ${InFile} | sort | uniq > allFam.txt


echo "counting families"
for fam in $(cat allFam.txt); do
	echo "finding ${fam}"
	egrep -c "$fam " ${InFile} >> ${countFAM}
done

paste allFam.txt ${countFAM} > ${labelFAM}