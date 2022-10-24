`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "environment.sv"
`include "../../dut/dut_top.sv"
`include "testbench.sv"

module tbench_top;
  
  // clock and reset signal declaration
  bit clk;
  bit reset;
  
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