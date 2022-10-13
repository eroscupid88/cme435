onbreak {resume}

set tbench_top tbench_top

if {! [file exists work]} {
  puts "CME435 EX3: Creating work library..."
  vlib work
}
vmap work work
vlog ./dut/*.sv +incdir+"./dut"
vlog ./dut/*.svp +incdir+"./dut"
vlog ./verification/phase6_monitor/tbench_top.sv +incdir+"./verification/phase6_monitor"
vsim $tbench_top
run -all
quit -f