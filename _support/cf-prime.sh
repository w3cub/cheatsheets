#!/usr/bin/env bash

(
  echo https://docs.w3cub.com/cheatsheets/
  (
    git ls-files \
      | grep -E '\.md$' \
      | grep -v -E 'CONTRIBUTING|README|Readme' \
      | grep -v -E '^_' \
      | sort \
      | uniq \
      | sed 's/\.md$//g'
  ) \
    | sed 's#^#https://docs.w3cub.com/cheatsheets/#g'
) \
  | xargs curl >/dev/null
