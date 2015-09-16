#!/bin/bash
BRAS="data"
RETWEET="data/brasileirao/retweets.txt"

# Correção aula passada
# Nome de usuários repetidos
# tr -s ' ' < $RETWEET | cut -d ' ' -f 5 | sort -u | sort -f | uniq -id # --all-repeated=separate

# without cut
# sort -uk 4 $RETWEET | sort -fk 4 | uniq -idf 3 

KEYWORDS="$BRAS/keywords/keywords"
TEXT="$BRAS/keywords/mda3.txt"

# count keywords with a shell loop
# tr -s [:space:][:punct:][:digit:] '\n' < $TEXT
# while read keyword
# do grep -ixc $keyword $TEXT
# done < $KEYWORDS | paste -d ' ' $KEYWORDS -

# Without shell loop
# tr -s [:space:][:punct:][:digit:] '\n' < $TEXT | grep -ixf $KEYWORDS | sort -f | uniq -ci

# Test presence of keywords
# sort $KEYWORDS > "$KEYWORDS.sorted" INCOMPLETO!!

# Comando 'sed'






