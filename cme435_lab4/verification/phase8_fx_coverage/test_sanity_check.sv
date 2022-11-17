program test_sanity_check(intf i_intf);
import lab4_pkg::*;
  environment #(transaction) env;
  initial begin
    env = new(i_intf);
    env.gen.repeat_count = 50000;
    $display("[sanity check]: \t\tStart sanity check");
    $display("[Sanity Check]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Sanity Check]: End of testcase(s) at %d",$time);
endprogram

