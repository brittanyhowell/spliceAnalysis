#!/bin/bash
# compileUnique.sh takes tables from findUnique.sh and compiles three criteria into one.

species="Human"


wkDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/bamReading/Split/${species}/CondensedTable
mergeDIR=${wkDIR}/Merge

cd ${wkDIR} 

cp bothIntron/Unique${species}_bothIntron.txt ${mergeDIR}
cp either/Unique${species}_either.txt ${mergeDIR}
cp Stringent/Unique${species}_stringent.txt ${mergeDIR}

cd ${mergeDIR}

# Uses only the absolute genomic coordinates: Use for CENSOR
cat *.txt | awk '{print $1 "\t" $2 "\t" $3}' | sort | uniq > ${species}SpliceL1.txt

# Adds relative L1 coordinates of gap, use for thesis
cat Unique*.txt | sort | uniq > ${species}SpliceL1-Rel.txt

echo "complete"