onbreak {resume}

if {! [file exists work]} {
  puts "CME435 EX1: Creating work library..."
  vlib work
}

#if [file exists work] {
#  vdel -all
#}
#vlib work


vlog -f script/ex1.f
puts "CME435 EX1: Compiling..."
set tbench_top tbench_top
vsim $tbench_top
puts "CME435 EX1: Running simulation..."
run -all
puts "CME435 EX1: Testbench top is \"$tbench_top\""
quit -f
