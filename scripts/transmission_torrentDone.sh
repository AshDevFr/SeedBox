#!/bin/bash

# Uncomment to debug:
# TR_TORRENT_DIR="$1"
# TR_TORRENT_NAME="$2"
# TVSHOWS_DIR="$3"
# MOVIES_DIR="$4"
# OTHER_DIR="$5"

cd $TR_TORRENT_DIR
filename="$TR_TORRENT_NAME"
logfile="/config/logs/scripts.log"

echo -n "$TR_TIME_LOCALTIME | " >> $logfile

# Creat missing folders
mkdir -p /config/logs

if [ -n "$TVSHOWS_DIR" ]
then
  mkdir -p /downloads/$TVSHOWS_DIR
fi

if [ -n "$MOVIES_DIR" ]
then
  mkdir -p /downloads/$MOVIES_DIR
fi

if [ -n "$OTHER_DIR" ]
then
  mkdir -p /downloads/$OTHER_DIR
fi

videoFile=$(find "$filename" -type f \( -iname \*.mkv -o -iname \*.avi -o -iname \*.mp4 -o -iname \*.mov -o -iname \*.mpeg -o -iname \*.mpg -o -iname \*.flv -o -iname \*.wmv -o -iname \*.srt \) -exec basename {} \; | head -n 1)

if [ -n "$videoFile" ] && [[ "$videoFile" =~ ^(.*)((S|s)[0-9]+?(E|e)[0-9]+|[0-9]+(X|x)[0-9]+).*$ || "$filename" =~ ^(.*)((S|s)[0-9]+?(E|e)[0-9]+|[0-9]+(X|x)[0-9]+).*$ ]]
then
  showRegex=$(echo ${BASH_REMATCH[1]} | sed -e 's/[^[:alpha:][:digit:]]/.*/g')
  targetDir=/downloads/$TVSHOWS_DIR

  IFS=$'\n'
  for dirName in $(find /downloads/$TVSHOWS_DIR -type d -type d -exec basename {} \;)
  do
    match=$(echo $dirName | grep -i -E "$showRegex")
    if [ -n "$match" ]
    then
      targetDir=/downloads/$TVSHOWS_DIR/$match
    fi
  done

	echo -n "TVShow | " >> $logfile
elif [ -n "$videoFile" ]
then
	echo -n "Movie | " >> $logfile
  targetDir=/downloads/$MOVIES_DIR
else
	echo -n "Other | " >> $logfile
  targetDir=/downloads/$OTHER_DIR
fi

ln -fs "$TR_TORRENT_DIR/$filename" $targetDir
echo "\"$filename\" linked in \"$targetDir\"" >> $logfile
# echo "ln -s $TR_TORRENT_DIR/$filename $targetDir"

echo "Transmission finished downloading \"$TR_TORRENT_NAME\" on $TR_TIME_LOCALTIME"
