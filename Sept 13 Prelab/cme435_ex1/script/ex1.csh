#!/bin/csh

# define variable
# set tbench_top = tbench_top

#source /CMC/scripts/mentor.questasim.mentor.questasim.2019.2.csh
source /CMC/scripts/mentor.questasim.2020.1_1.csh
#cd /home/dtv782/engr-ece/CME\ 435/Sept\ 13\ Prelab/cme435_ex1
#if (! -e work) then
#        echo CME435 $0\: Creating work library...
#        vlib work
#endif
# vmap work work
# vlog commands
# echo CME435 $0\: Compiling...
# vlog -f script/ex1.f
# vsim command here
# echo CME435 $0\: Running simulation...
vsim -c -do script/ex1_all.do <<eof
eof
