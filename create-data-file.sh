#!/bin/bash

# To be used with financial-news-dataset
DELIM="=========="

create_headlines_file() {
  NEWS_DIR=$1
  OUTPUT_FILE=$2
  DATED_DIRS=$(ls -v $NEWS_DIR)

  if [ -f $OUTPUT_FILE ]; then
    echo "${OUTPUT_FILE} already exists"
    exit 1
  fi

  {
    for DIR in $DATED_DIRS; do
      echo "${DELIM}${DIR}${DELIM}"
      for NEWS in $NEWS_DIR/$DIR/*; do
        head -1 $NEWS | sed -r 's/^.{3}//'
      done
    done
  } >> $OUTPUT_FILE
}

select_headlines() {
  QUERY=$1
  INPUT=$2
  OUTPUT=$3

  if [ -f $OUTPUT ]; then
    echo "${OUTPUT} already exists"
    exit 1
  fi

  grep -E "${DELIM}|${QUERY}" $INPUT > $OUTPUT
}

case $1 in
  "create")
    create_headlines_file "${@:2}"
    ;;
  "select")
    select_headlines "${@:2}"
esac
