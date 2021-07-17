#!/bin/bash

foreground=$(xgetres foreground)
background=$(xgetres background)
highlight=$(xgetres color5)
lfr=$(xgetres color2)
nfr=$(xgetres color13)
cfr=$(xgetres color12)

dunst	-lf "$foreground" \
	-nf "$foreground" \
	-cf "$foreground" \
	-lb "$background" \
	-nb "$background" \
	-cb "$background" \
	-lh "$highlight"  \
	-nh "$highlight"  \
	-ch "$highlight"  \
	-lfr "$lfr" \
	-nfr "$nfr" \
	-cfr "$cfr"
