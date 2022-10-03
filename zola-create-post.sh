#!/bin/bash
DATE=$(date +%Y-%m-%d)
TITLE=$1
FILE=$(echo $TITLE-$DATE | sed 's/ /_/g')

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
---
||||
:----:|:----:|:----:
example|table|3|rows

EOF
fi

