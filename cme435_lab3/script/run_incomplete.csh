#!/bin/csh
################################################################################
#
# Copyright 2022 Daniel H.Y. Teng. All Rights Reserved.
#
#################################################################################

# Set up Questa SIM
#source /CMC/scripts/mentor.questasim.mentor.questasim.2019.2.csh
source /CMC/scripts/mentor.questasim.2020.1_1.csh

# Phase independent
set rootdir = `dirname $0`
set rootdir = `cd $rootdir && pwd`
set script_name = $0:t
#echo script $script_name
set phase_no = `echo $script_name:r | sed -e  s/run_//`
#echo phase $phase_no

switch ($phase_no)
  case 'phase1':
    set phase_name = top
    breaksw
  case 'phase2':
    set phase_name = environment
    breaksw
  default:
    echo Unknown phase number: $phase_no
    breaksw
  endsw
endif

set workdir = "$rootdir/../verification/${phase_no}_$phase_name"
if (! -d $workdir ) then
  echo "ERROR: $workdir doesn't exist!"
  exit 0
else
  echo "Working directory: $workdir"
endif


