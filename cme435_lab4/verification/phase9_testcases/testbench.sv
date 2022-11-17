program testbench(intf i_intf);
import lab4_pkg::*;
  environment #(transaction) env;

  initial begin
    env = new(i_intf);
    env.gen.repeat_count = 50000;
    $display("[sanity check]: \t\tStart sanity check");
    env.run();
    $display("[sanity check] erorr is  %d",env.scb.no_errors);
  end

  final
    $display("[Testbench]: End of testcase(s) at %d",$time);
endprogram