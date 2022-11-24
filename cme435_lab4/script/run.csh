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
echo "rootdir : $rootdir"
set rootdir = `cd $rootdir && pwd` 
echo "rootdir : $rootdir"
set script_name = $0:t
#echo script $script_name
set phase_no = `echo $script_name:r | sed -e  s/run_//`
#echo phase $phase_no
echo "running $phase_no"

switch ($phase_no)
  case 'phase1':
    set phase_name = top
    breaksw
  case 'phase2':
    set phase_name = environment
    breaksw
  case 'phase3':
    set phase_name = base
    breaksw
  case 'phase4':
    set phase_name = generator
    breaksw
  case 'phase5':
    set phase_name = driver
    breaksw
  case 'phase6':
    set phase_name = monitor
    breaksw
  case 'phase7':
    set phase_name = scoreboard
    breaksw
  case 'phase8':
    set phase_name = fx_coverage
    breaksw
  case 'phase9':
    set phase_name = testcases
    breaksw
  default:
    echo Unknown phase number: $phase_no
    breaksw
  endsw
endif

set workdir = "$rootdir/../verification/${phase_no}_$phase_name"
if (! -d "$workdir" ) then
  echo "ERROR: $workdir doesn't exist!"
else
  echo "Working directory: $workdir"
  cd "$workdir/../.."
  vsim -c -do "script/${phase_no}_${phase_name}.do" 
  vcover report -details alu_fcov.ucdb -output alu_fcov.rpt 
  vcover report -details -html alu_fcov.ucdb -output alu_fcov_html.html <<eof
eof
endif
