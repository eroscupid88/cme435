`include "interface.sv"
`include "transaction.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "generator.sv"
`include "environment.sv"
`include "../../dut/dut_top.sv"
`include "test_sanity_check.sv"
`include "testbench.sv"
`include "test_addition.sv"
`include "test_subtraction.sv"
`include "test_multiplication.sv"
`include "test_division.sv"
`include "test_logical_shift_left.sv"
`include "test_logical_shift_right.sv"
`include "test_rotate_left.sv"
`include "test_rotate_right.sv"
`include "test_and.sv"
`include "test_or.sv"
`include "test_xor.sv"
`include "test_nor.sv"
`include "test_nand.sv"
`include "test_xnor.sv"
`include "test_A_bigger_B.sv"
`include "test_A_equal_B.sv"

module tbench_top;
  
  // clock and reset signal declaration
  bit clk;
  bit reset;
  
initial 
begin
  dut.alu_core.student_no = 11100292;
  dut.alu_core.bug_mode = 1;
  dut.alu_core.enable_dut_bugs;
end

  // clock generation
  always #5 clk = ~clk;
  
  // reset generation
  initial begin
    reset = 1;
    #6 reset = 0;
  end
  
  // create interface instance to connect DUT and testcase
  intf i_intf(.*);
  
  // create testcase instance where interface handle is passed to test as an argument
  testbench test(.*);

  
  // create DUT instance where interface signals are connected to the DUT ports
  dut_top dut(.*);

  // enable wave dump 
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end 

endmodule