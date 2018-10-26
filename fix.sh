#!/usr/bin/env sh

#
# Fixes for improperly delimited spreadsheets
#


# ==============================================================================
# 2018 FIXES
# ==============================================================================

#
# MISTAKES
# A non-escaped value: "Title I, Part A Improving Basic Programs (1003a)"
# A non-escaped value: "Title I, SOD, Improving"
#
INFILE=data/GRANT_LEVELS/2018-paydetl-ORIGINAL.csv
OUTFILE=data/GRANT_LEVELS/2018-paydetl.csv

echo "FIXING FILE 2018"
echo "INPUT FILE LENGTH:" $(cat $INFILE | wc -l)
cat $INFILE | sed 's/Title I, SOD, Improving/Title I - SOD - Improving/g'\
		   | sed 's/Title I, /Title I: /g' > $OUTFILE
echo "OUTPUT FILE LENGTH:" $(cat $OUTFILE | wc -l)

#
# ==============================================================================
# 2017 FIXES
# ==============================================================================

#
# Mistake 1
#
# Mistake: "Title I, Part A Improving"
# Non-escaped value: "Title I, SOD, Improving"

INFILE=data/GRANT_LEVELS/2017-paydetl-ORIGINAL.csv
OUTFILE=data/GRANT_LEVELS/2017-paydetl.csv

echo "FIXING FILE 2017"
echo "INPUT FILE LENGTH:" $(cat $INFILE | wc -l)
cat $INFILE  | sed 's/Title I, /Title I: /g'  \
    | sed 's/Title I: SOD, Improving/Title I - SOD - Improving/g' >  $OUTFILE


# ==============================================================================
# 2004 FIXES
# ==============================================================================

#
# MISTAKE 1
# A non-escaped value: "OCT, 3" should be "OCT 3"
#
INFILE=data/GRANT_LEVELS/2004-paydetl-ORIGINAL.csv
OUTFILE=data/GRANT_LEVELS/2004-paydetl.csv

echo "FIXING FILE 2004"
echo "INPUT FILE LENGTH:" $(cat $INFILE | wc -l)
# cat $INFILE | sed 's/OCT,3/OCT. 3/g' | grep "OCT,"
cat $INFILE | sed 's/OCT,3/OCT. 3/g' | sed 's/OCT,03/OCT. 03/g'> $OUTFILE
echo "OUTPUT FILE LENGTH:" $(cat $OUTFILE | wc -l)

# ==============================================================================
# 2009 FIXES
# ==============================================================================

#
# MISTAKE 1
# A non-escaped value: "DEC,8" should be "DEC. 8"
#
INFILE=data/GRANT_LEVELS/2009-paydetl-ORIGINAL.csv
OUTFILE=data/GRANT_LEVELS/2009-paydetl.csv

echo "FIXING FILE 2009"
echo "INPUT FILE LENGTH:" $(cat $INFILE | wc -l)
cat $INFILE | sed "s/DEC,08/DEC. 08/g" > $OUTFILE
echo "OUTPUT FILE LENGTH:" $(cat $OUTFILE | wc -l)


# ==============================================================================
# 2011 FIXES
# ==============================================================================

#
# MISTAKE 1
# A non-escaped value: "MAY,11" should be "MAY. 11"
#
INFILE=data/GRANT_LEVELS/2011-paydetl-ORIGINAL.csv
OUTFILE=data/GRANT_LEVELS/2011-paydetl.csv

echo "FIXING FILE 2009"
echo "INPUT FILE LENGTH:" $(cat $INFILE | wc -l)
cat $INFILE | sed 's/MAY,11/MAY. 11/g' | sed 's/IDEA,/IDEA_/g' | sed 's/APR,11/APR. 11/g' > $OUTFILE
echo "OUTPUT FILE LENGTH:" $(cat $OUTFILE | wc -l)
