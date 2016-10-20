#!/bin/bash
# Script extracts the genomic and L1 relative coordinates from the pulled out SJ tables. 

species="Mouse"
category="either" # Keep at stringent for most reliable data

wkDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/bamReading/Split/${species}
fullDIR=${wkDIR}/findActive/${category}
uniqueDIR=${wkDIR}/CondensedTable/${category}



cd ${fullDIR}
for file in *.txt ; do
	name="${file%.txt}"
	noGAP="$(echo $name | sed 's/gapInRead//g')"

	# echo $name
	# echo $noGAP
  awk '{print $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' ${file} | sort | uniq > ${uniqueDIR}/${noGAP}.txt


cd ${fullDIR}
done

cd ${uniqueDIR}
cat *${category}.txt | sort | uniq > Unique${species}_${category}.bed

# Prints only the L1 relative positions
cat *${category}.txt | awk '{print $4 "\t" $5}' | sort | uniq > Unique${species}_${category}_relative.bed

mv Unique${species}_${category}.bed Unique${species}_${category}.txt
mv Unique${species}_${category}_relative.bed Unique${species}_${category}_relative.txt

echo "complete"