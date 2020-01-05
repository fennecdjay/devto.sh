#!/bin/bash

# check there is enough args
[ "$#" -lt 2 ] && {
  echo "usage: $0 <source> <api_key>"
  exit 1
}

SRC_DIR="$1"
API_KEY="$2"
MKD_EXT=".md"

check() {
  if [ "$3" = "null" ]
  then
    echo "😡: error $1 post '$2'"
    return 1
  fi
  echo "😊: success $1 post '$2'"
  return 0
}

send() {
  curl -X "$1" -H "Content-Type: application/json" \
     -H "api-key: $API_KEY" \
     -d "$(file2json "$2")" \
     "https://dev.to/api/articles/$3" 2>/dev/null
}

create() {
  id=$(send "POST" "$1" | jq -r ".id")
  check "creating" "$1" "$id" && echo "$id" > "$2"
}

update() {
  id=$(send "PUT" "$1" "$(cat "$2")" | jq -r ".id")
  check "updating" "$1" "$id"
}

file2json() {
  var=$(cat "$1")
  jq -n --arg v "$var" '{"article":{"body_markdown":$v}}'
}

for post in "$SRC_DIR/"*"$MKD_EXT"
do
  id="${post:0:-2}id"
  if [ -f "$id" ]
  then update "$post" "$id"
  else create "$post" "$id"
  fi
done
