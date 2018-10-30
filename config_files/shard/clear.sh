for f in ./*.bkp; do mv "$f" ".$(echo ${f} | cut -d '.' -f2).cfg"; done
