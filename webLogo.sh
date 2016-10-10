#!/bin/bash
# Script makes webLOGOs

## Make sure input file is in fasta. If it isn't, use this command: awk '{print ">" FNR "\n" $0}'
#gapInRead0h_Ctrl_R2_bothStringent.txt | awk '{print $7}' |  awk '{print ">" FNR "\n" $0}'

## To change splice junction, change the column number printed in the awk.
# $7 is the 5', $8 is the 3'



wkDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/bamReading/Split/Human/findActive/
inTable=${wkDIR}/either
spliceTableDIR=${inTable}/spliceFasta
junction="8"

site="either-three"
plotDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/bamReading/plots/webLogo/${site}


if [ -d $plotDIR ]; then
	rm -r $plotDIR 
	mkdir $plotDIR
	echo "plot folder exists... replacing" 
else 
	echo "creating plot folder" 
	mkdir $plotDIR
fi 

if [ -d $spliceTableDIR ]; then
	rm -r $spliceTableDIR 
	mkdir $spliceTableDIR
	echo "spliceFasta folder exists... replacing" 
else 
	echo "creating spliceFasta folder" 
	mkdir $spliceTableDIR
fi 


cd ${inTable}
for table in gap*.txt ; do 

	fileName="${table%.txt}"
	noGAP="$(echo $fileName | sed 's/gapInRead//g')"
	
	echo "making $noGAP fasta"
	
	# Convert to fasta
	cat $table | awk '{print $'${junction}'}' |  awk '{print ">" FNR "\n" $0}' > "${spliceTableDIR}/${noGAP}_${site}.fasta"
done

cd ${spliceTableDIR}

for fasta in *.fasta ; do 

	logoName="${fasta%.txt}"

	echo "making $logoName logo"
	weblogo --number-interval 2 --aspect-ratio 4 -y "" --size large --title "$noGAP" --annotate '-3,-2,-1,+1,+2,+3' -W 30  -c classic --format PDF -f ${fasta} -U probability -o ${plotDIR}/${logoName}.pdf 
done

echo "complete"
