#!/bin/bash
## Script extracts columns containing 5' and 3' intronic splice sites from files. There are better scripts to use. Probably don't bother with this one.

wkDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/bamReading/Split/limitedGap/SpliceSites
outDIR=${wkDIR}/goConverted

if [ -d $outDIR ]; then
    echo "Folder $outDIR exists ..." 
else
    mkdir $outDIR
    echo "Folder $outDIR does not exist"     
    mkdir $outDIR
fi

cd ${wkDIR}

for file in gapInRead*.txt; do
	makeName=$(echo $file | sed 's/_/	/g' | awk '{print $2}')
	awk '{print $7}' $file > "${outDIR}/${makeName}_5.txt"
	awk '{print $8}' $file > "${outDIR}/${makeName}_3.txt"	
done

echo "complete"
