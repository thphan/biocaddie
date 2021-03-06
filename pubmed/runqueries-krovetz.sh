#!/bin/bash

if [ -z "$1" ]; then
   echo "./runqueries.sh <topics> <collection>"
   exit 1;
fi
topics=$1

if [ -z "$2" ]; then
   echo "./runqueries.sh <topics> <collection>"
   exit 1;
fi
col=$2

base=/data/biocaddie

mkdir -p output/pubmed-krovetz/$col/$topics
find queries/pubmed/$col/$topics -type f | while read file
do
    for mu in 50 250 500 1000 2500 5000 10000
    do
        fileName=`basename $file`
        echo "IndriRunQuery -index=$base/indexes/biocaddie_all.krovetz -rule=method:dir,mu:$mu -trecFormat $file > output/pubmed-krovetz/$col/$topics/$fileName,dir-mu:$mu"
    done
done

# pubmed/runqueries.sh short combined | parallel -j 10 bash -c "{}"
