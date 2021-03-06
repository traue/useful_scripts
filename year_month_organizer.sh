# This script is used to separate all files in a folder into subfolders, organizing them by year/month.
# Very useful for organizing photos.
# Just run it inside the folder to be organized. Be careful: DO NOT run on any important root!!!
# by Thiago G. Traue
for FILE in *; do
  DIR_YEAR=$(stat -f "%Sm" -t "%Y" "${FILE}");
  DIR_MONTH=$(stat -f "%Sm" -t "%m" "${FILE}");
  DEST=$DIR_YEAR"/"$DIR_MONTH"/";
  if [ -d "$DIR_YEAR" ]; then
    if [ -d "$DEST" ]; then
      echo 'Moving... ' $FILE " to " "$DEST" ;
      mv "$FILE" "$DEST";
    else
      cd $DIR_YEAR;
      mkdir $DIR_MONTH;
      cd ..;
      echo 'Moving... ' $file " to " "$DEST" ;
      mv "$FILE" "$DEST";
    fi
  else
    mkdir $DIR_YEAR;
    cd $DIR_YEAR;
    mkdir $DIR_MONTH;
    cd ..;
    echo 'Moving... ' $FILE " to " "$DEST" ;
    mv "$FILE" "$DEST";
  fi
done
