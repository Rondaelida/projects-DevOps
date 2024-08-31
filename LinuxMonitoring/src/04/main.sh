#!/bin/bash

param=$(bash ./ridconf.sh)


colors=$(bash ./color.sh ${param[@]:0:7})

bash ./os.sh $colors

bash ./printlast.sh $param