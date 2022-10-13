onbreak {resume}

set test_transaction_class test_transaction_class

if {! [file exists work]} {
  puts "CME435 EX3: Creating work library..."
  vlib work
}
vmap work work
vlog ./verification/phase3_base/*.sv +incdir+"./verification/phase3_base"
vsim $test_transaction_class
run -all
quit -f