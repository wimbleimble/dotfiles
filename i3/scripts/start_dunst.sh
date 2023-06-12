#!/bin/bash

foreground=$(xgetres foreground)
background=$(xgetres background)
highlight=$(xgetres color5)
lfr=$(xgetres color2)
nfr=$(xgetres color13)
cfr=$(xgetres color12)

exec dunst

