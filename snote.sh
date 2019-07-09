#!/bin/bash

TIMESTAMP=`date -u +"%Y-%m-%d"`
WEEK_YEAR=`date +"%G"`
WEEK=`date +"%V"`
NEXT_WEEK=`printf %02d $((10#$WEEK + 1))`
LAST_WEEK=`printf %02d $((10#$WEEK - 1))`

BASE=week
if [[ -n $1 ]]
then
    BASE=$1
fi

FILENAME=$BASE
if [ $BASE == "list" ]
then
   ls *.md
   exit 0
elif [ $BASE == "week" ] 
then 
    FILENAME=$BASE-$WEEK_YEAR-$WEEK.md
elif [ $BASE == "next-week" ] 
then
    # Doesn't handle year wrapping - your new years resolutions will be lost
    FILENAME="week-$WEEK_YEAR-$NEXT_WEEK.md"
elif [ $BASE == "last-week" ] 
then
    # Doesn't handle year wrapping - your new years resolutions will be lost
    FILENAME="week-$WEEK_YEAR-$LAST_WEEK.md"
elif [ ! -f $FILENAME ]
then
    FILENAME=$BASE-$TIMESTAMP.md
fi

vim $FILENAME
if [ -f $FILENAME ]
then
    git add $FILENAME
    git commit -m "Update $FILENAME"
fi
