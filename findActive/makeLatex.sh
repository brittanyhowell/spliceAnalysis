#!/bin/bash
## Some helpful commands to make the final L1 splice tables into LaTeX tables.


species="Human"

mergeDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/bamReading/Split/${species}/CondensedTable/Merge
appendixDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Thesis/appendices

cd ${mergeDIR}
# Make tables from Merged data
cat ${species}SpliceL1.txt | awk '{print   $1 " & " $2 " & " $3 " \\\\"}' > ${appendixDIR}/${species}SpliceL1.tex

echo "complete"

