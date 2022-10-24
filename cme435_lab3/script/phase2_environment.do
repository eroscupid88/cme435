onbreak {resume}

set tbench_top tbench_top

if {! [file exists work]} {
  puts "CME435 EX3: Creating work library..."
  vlib work
}
vmap work work
vlog ./dut/*.svp
vlog ./dut/*.sv +incdir+"./dut"
vlog ./verification/phase2_environment/tbench_top.sv +incdir+"./verification/phase2_environment"
vsim $tbench_top
run -all
quit -f