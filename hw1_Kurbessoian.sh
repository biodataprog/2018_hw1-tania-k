#!/bin/bash

#1. Getting data

wget https://biodataprog.github.io/2018_programming-intro/data/Ecoli-vs-Yersinia.BLASTP.tab.gz
du -h Ecoli-vs-Yersinia.BLASTP.tab.gz

#2. Compressing and uncompressing

gunzip Ecoli-vs-Yersinia.BLASTP.tab.gz
du -h Ecoli-vs-Yersinia.BLASTP.tab

#3. Counting and viewing

head -25 Ecoli-vs-Yersinia.BLASTP.tab  
tail -3 Ecoli-vs-Yersinia.BLASTP.tab
wc -l Ecoli-vs_Yersinia.BLASTP.tab

#4. Sorting

wget https://biodataprog.github.io/2018_programming-intro/data/Nc3H.expr.tab
(head -n 1 Nc3H.expr.tab && tail -n +2 Nc3H.expr.tab | sort -k 6) > Nc20H.expr.sorted.tab
head -10 Nc20H.expr.sorted.tab

#5. Finding and Counting

grep -i -c 'CDS  ' D_mel.63B12.gbk
sort -k3 -n -r Ecoli-vs-Yersinia.BLASTP.tab | cut -f1,3 | grep -c 100.00
awk ' $3 > 90.00 {print $1, $3}' Ecoli-vs-Yersinia.BLASTP.tab | sort -k3 -n -r | wc -l

#6. Sort and Uniq

wget https://biodataprog.github.io/2018_programming-intro/data/codon_table.txt
cut -f3 codon_table.txt | uniq -c
