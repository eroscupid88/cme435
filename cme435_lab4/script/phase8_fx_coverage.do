onbreak {resume}

set tbench_top tbench_top

if {! [file exists work]} {
  puts "CME435 EX3: Creating work library..."
  vlib work
}
vmap work work
vlog ./dut/*.sv +incdir+"./dut"
vlog ./dut/*.svp +incdir+"./dut"
vlog ./verification/phase8_fx_coverage/globals.sv +incdir+"./verification/phase8_fx_coverage"
vlog ./verification/phase8_fx_coverage/lab4_pkg.sv +incdir+"./verification/phase8_fx_coverage"
vlog ./verification/phase8_fx_coverage/tbench_top.sv +incdir+"./verification/phase8_fx_coverage"
vsim $tbench_top
coverage save -onexit alu_fcov.ucdb
run -all
quit -f