#!/bin/bash
DATE=$(date +%Y-%m-%d)
TITLE=$1
FILE=$(echo $TITLE-$DATE | sed 's/ /_/g')

if [ -z $TITLE ]; then
  echo "set a name without spaces"
fi

if [ -f "content/articles/$FILE/index.md" ]; then
	$EDITOR content/articles/$FILE/index.md
else
  mkdir -p content/articles/images
	mkdir -p content/articles/"$FILE"
	cat <<EOF>content/articles/"$FILE"/index.md
---
title: $TITLE
date: $DATE
extra:
  image: web/index.webp
taxonomies:
  tags:
    - Rezept
  categories:
    - Allgemein
    - Kochen-Vegan
    - Koch-Rezepte
    - Kochen-Vegetarisch
    - Back-Rezepte
    - Backen-Vegan
    - Backen-Vegetarisch
    - auf-die-schnelle
    - auf-die-schnelle-vegetarisch
    - auf-die-schnelle-vegan
draft: true
---
||||
:----:|:----:|:----:
example|table|3|rows

EOF
fi

