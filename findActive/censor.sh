#!/bin/bash

# Invoked by:
#
# sbatch mCensor.sh
#

#SBATCH -p batch 
#SBATCH -N 1 
#SBATCH -n 8 
#SBATCH --time=0-12:00 
#SBATCH --mem=40GB 

# Notification configuration 
#SBATCH --mail-type=END                                         
#SBATCH --mail-type=FAIL                                        
#SBATCH --mail-user=brittany.howell@student.adelaide.edu.au    

module load bioperl/1.6.924 
module load censor/4.2.29 
module load wu-blast/2.0


# replace file.fasta with your mouse L1s
# and Repbaselibrary.fasta with the Repbase library
censor -bprm cpus=8 -lib RepBase21.03_all_seqs.ref mouseORF1ORF2min4kbmax8kb.fasta
#mouseUniqueL1.fasta