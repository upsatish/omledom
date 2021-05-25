#!/bin/sh

FILES="*.bz2 *.gz *.tar *.tgz *.tbz *.lzma"
OUT="SUMS.txt"
DGST="-sha256 -md5"

#cat /dev/null > $OUT
mv ${OUT} ${OUT}.old
for d in $DGST; do
  openssl dgst $d $FILES >> $OUT
done
diff -u ${OUT}.old ${OUT}
