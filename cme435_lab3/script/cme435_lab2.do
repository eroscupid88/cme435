onbreak {resume}

set tbench_top tbench_top


if {! [file exists work]} {
  puts "CME435 EX3: Creating work library..."
  vlib work
}

vlog -f script/cme435_lab2.f
puts "compiling..."
vsim $tbench_top
run -all
puts "Test bench top is \"$tbenchtop\""
quit -f