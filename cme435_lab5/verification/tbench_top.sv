`include "interface.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "generator.sv"
`include "environment.sv"
`include "../../dut/dut_top.sv"
`include "test_sanity_check.sv"
`include "test_addition.sv"
`include "test_addition_overflow.sv"
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
`include "test_subtraction_overflow.sv"


module tbench_top;
  
  // clock and reset signal declaration
  bit clk;
  bit reset;
  
initial 
  begin
    dut.alu_core.student_no = 11100292;
    dut.alu_core.bug_mode = 2;
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
  // uncomment wanted testcase


  test_sanity_check test(.*);
  // test_addition test(.*);
  // test_addition_overflow test(.*);
  // test_subtraction_overflow test(.*);
  // test_subtraction test1(.*);
  // test_multiplication test2(.*);
  // test_division test3(.*);
  // test_logical_shift_left test4(.*);
  // test_logical_shift_right test5(.*);
  // test_rotate_left test6(.*);
  // test_rotate_right test7(.*);
  // test_and test8(.*);
  // test_or test9(.*);
  // test_xor test10(.*);
  // test_nor test11(.*); 
  // test_nand test12(.*);
  // test_xnor test13(.*);
  // test_A_bigger_B test14(.*);
  // test_A_equal_B test15(.*);


  
  // create DUT instance where interface signals are connected to the DUT ports
  dut_top dut(.*);

  // enable wave dump 
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end 

endmodule