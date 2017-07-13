#!/bin/bash

SJ=SJList.txt 

for n in ${SJ} ; do 
	 awk '{if ( $16 == "gt" || $17 == "ag") print $0}'
	done