#!/bin/bash

while true; do
  read -p "package scheme (rootful [f], rootless [l], or jailed [j]): " scheme

  case "$scheme" in
    rootful | f)
      export SCHEME=rootful
      break
      ;;
    rootless | l)
      export SCHEME=rootless
      break
      ;;
    jailed | j)
      export SCHEME=jailed
      break
      ;;
    exit | e)
      exit 1
      break
      ;;
    *)
      if [ -z "$scheme" ]; then
        export SCHEME=rootful
        break
      else
        echo "Invalid scheme"
      fi
      ;;
  esac
done

if [ ! -d "debs/rootful" ]; then
  mkdir -p debs/rootful
fi

if [ ! -d "debs/rootless" ]; then
  mkdir -p debs/rootless
fi

if [ ! -d "debs/jailed" ]; then
  mkdir -p debs/jailed
fi

make clean package

unset SCHEME