#!/bin/bash

#configuration:
content="content_template"  
layout_for_jekyll="posts"  # !! RESET this !! setting this to be the layout used in pages

#parameters
postname=$(date '+%Y-%m-%d-%H%M%S')
postname_ext=.html
backupcontent=backup_content/$(date '+%Y-%m-%d-%H%M%S')
backupcontent_ext=.txt
beginhtml=0

if test -z $1
then
  if [ -f "content_template" ];
  then
    input="content_template"
    outbackup=1
  else
    echo "[xpost]cannot find template: 'content_template' not under current directory."
    exit 0
  fi
else
  config=$1
  if [ "$config"x = "-clean"x ]; then
    echo "title:" > content_template
    echo "category:" >> content_template
    echo "tags:" >> content_template
    echo "---" >> content_template
    echo "" >> content_template
    echo "[xpost]clean complete."
    exit 0
  fi

  if [ "$config"x = "-date"x ]; then
    echo "" > ${postname}_$2${postname_ext}
    exit 0
  fi

  if [[ ! -z $2 ]] && [[ "$config"x = "-format"x ]] && [[ -f $2 ]];
  then
    postname=$2
    postname=${postname%.*}
    input=$2
  else
        echo "Usage: ./xpost.sh [-config]"
        echo "Config: "
        echo -e "-format [file]\t- format the backup content to be the new post"
        echo -e "-clean \t\t- clean the content template"
        echo -e "-date [name]\t- produce empty file with name: year-month-date-time_name.html"
        exit 0
  fi
fi

#init output
touch ${postname}${postname_ext}
echo "---" > ${postname}${postname_ext}

#print header
echo "layout: ${layout_for_jekyll}" >> ${postname}${postname_ext}

#begin find html part
while read line
do
if [ "$beginhtml" -gt 0 ] # if beginhtml > 0
then
    echo "${line}" >> ${postname}.tmp
else echo "${line}" >> ${postname}${postname_ext}
fi

if [[ ${#line} -gt 4 ]] && [[ "${line:0:6}"x = "title:"x ]] && [[ -z ${posttitle} ]]
then
  posttitle=${line:6}
  posttitle=${posttitle//" "/_}
fi

if [ "$line"x = "---"x ];  # if line content == "---"
then
  beginhtml=$(($beginhtml+1))
  #beigin to print header( the title part )
  cat header >> ${postname}${postname_ext}
fi

#if reformat do not backup
if [[ ! -z $outbackup ]]
then echo "${line}" >> ${backupcontent}${backupcontent_ext}
fi
done < ${input}

#begin format
./xpost2html.sh ${postname}.tmp
while read line
do
echo "${line}" >> $postname$postname_ext
done < ${postname}.tmp${postname_ext}


rm ${postname}.tmp$postname_ext
rm ${postname}.tmp

#print footer 
cat footer >> ${postname}${postname_ext}

#format outputname
if [[ -z ${posttitle} ]] || [[ -z $outbackup ]]
then
  echo "output: ${postname}${postname_ext}"
else
  mv $postname$postname_ext ${postname}_${posttitle}${postname_ext}
  mv ${backupcontent}${backupcontent_ext} ${backupcontent}_${posttitle}${backupcontent_ext}
  echo "output: ${postname}_${posttitle}${postname_ext}"
fi