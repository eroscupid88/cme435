`include "interface.sv"
`include "transaction.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "generator.sv"
`include "environment.sv"
`include "../dut/dut_top.sv"
`include "testbench.sv"

// `include "driver.sv"
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
  intf i_intf(clk,reset);
  
  // create testcase instance where interface handle is passed to test as an argument
  testbench test(i_intf);
  
  // create DUT instance where interface signals are connected to the DUT ports
  dut_top dut(i_intf);

  // enable wave dump 
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end 

endmodule