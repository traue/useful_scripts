# This script is used to separate all files in a folder into subfolders, organizing them by year/month.
# Very useful for organizing photos.
# Just run it inside the folder to be organized.
# Be careful: DO NOT run on any important root!!!
# by Thiago G. Traue
for FILE in *; do
  # If you don't want to ignore .sh file, comment this block:
  if [ "${FILE: -3}" == ".sh" ]; then
    echo "Igoring .sh file...";
    continue
  fi
  DIR_YEAR=$(stat -f "%Sm" -t "%Y" "${FILE}");
  DIR_MONTH=$(stat -f "%Sm" -t "%m" "${FILE}");
  DEST=$DIR_YEAR"/"$DIR_MONTH"/";
  if [ -d "$DIR_YEAR" ]; then
    if ! [ -d "$DEST" ]; then
      cd $DIR_YEAR;
      mkdir $DIR_MONTH;
      cd ..;
    fi
  else
    mkdir $DIR_YEAR;
    cd $DIR_YEAR;
    mkdir $DIR_MONTH;
    cd ..;
  fi
  echo 'Moving... ' $FILE " to " "$DEST";
  mv "$FILE" "$DEST";
done
