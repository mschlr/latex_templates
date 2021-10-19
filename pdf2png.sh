#!/bin/bash

# Script to convert PDF to PNG (ImageMagick)
# Use `force` as the first positional option
# for overwriting existing output.

for i in $(ls ./*pdf | sed 's/\.pdf$//')
do
	if [ ! -f ${i}.png ] && [[ $1 == "" ]]; then
		echo "Convert ${i}.pdf to ${i}.png"
		convert -density 300 ${i}.pdf -resize 33% -colorspace RGB ${i}.png
	elif [[ $1 == "force" ]]; then
		echo "Force convert ${i}.pdf to ${i}.png"
		convert -density 300 ${i}.pdf -resize 33% -colorspace RGB ${i}.png
	else
		echo "${i}.png already exists!"
	fi
done
