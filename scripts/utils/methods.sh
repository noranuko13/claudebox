#!/bin/bash

info () {
  printf "%s\n" "$@" | while IFS= read -r line; do
    printf "\e[36m%s\e[m\n" "$line"
  done
}
