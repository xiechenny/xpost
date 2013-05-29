#!/bin/bash

#   usage:
#   /b text b/  bolder
#   /i text i/  italic
#   /t text     padidng text for 4 space

#parametters
padding="/t "
bolderl="/b "
bolderr=" b/"
italicl="/i "
italicr=" i/"
underlinel="/u "
underliner=" u/"
code="<pre>"
coder="</pre>"
beginpre=0

if test -z $1 
then
    echo "Usage: ./xpost2html.sh [inputfile]"
    exit 0
fi

#init output
input=$1
postname=${input}.html
touch $postname
echo "" > $postname

#begin format change
cat $input | while read line
do
  #if enter <pre> area
  mpstr=$(echo ${line} | awk '/<pre>/')
  mpend=$(echo ${line} | awk '/<\/pre>/')
  if [ ${#mpstr} -gt 0 ]
  then beginpre=1
  fi

  if [ $beginpre -eq 0 ]
  then
  line=${line//"$bolderl"/<b>}
  line=${line//"$bolderr"/</b>}
  line=${line//"$italicl"/<i>}
  line=${line//"$italicr"/</i>}
  line=${line//"$underlinel"/<u>}
  line=${line//"$underliner"/</u>}
  line=${line//"$padding"/&nbsp;&nbsp;&nbsp;&nbsp;}
  line="${line}<br/>"
  fi

  if [ ${#mpend} -gt 0 ]
  then beginpre=0
  fi
  echo "${line}" >> $postname
done
#end of reformat
