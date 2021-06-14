#!/bin/bash

foreground=$(xgetres foreground)
background=$(xgetres background)
highlight=$(xgetres color5)
lfr=$(xgetres color2)
nfr=$(xgetres color6)
cfr=$(xgetres color1)

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
