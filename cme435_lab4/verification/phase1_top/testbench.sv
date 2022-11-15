// `include "environment.sv"
program testbench(intf  i_intf);

  initial begin
    $display("[Testbench]: start of testcase(s) at %0d",$time);
  end

  final
    $display("[Testbench]: End of testcase(s) at %d",$time);
endprogram