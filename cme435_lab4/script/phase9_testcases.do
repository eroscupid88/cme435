onbreak {resume}

set tbench_top tbench_top

if {! [file exists work]} {
  puts "CME435 EX3: Creating work library..."
  vlib work
}
vmap work work
vlog ./dut/*.sv +incdir+"./dut"
vlog ./dut/*.svp +incdir+"./dut"
vlog ./verification/phase9_testcases/lab4_pkg.sv +incdir+"./verification/phase9_testcases"
vlog ./verification/phase9_testcases/tbench_top.sv +incdir+"./verification/phase9_testcases"
vsim $tbench_top
coverage save -onexit alu_fcov.ucdb
run -all
quit -f