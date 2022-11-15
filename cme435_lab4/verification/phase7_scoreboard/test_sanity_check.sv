program test_sanity_check(intf i_intf);
import lab4_pkg::*;
  environment env;
  transaction trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 10;
    env.gen.alu_opcode_in = 0;
    $display("[sanity check]: \t\tStart sanity check");
    $display("[Sanity Check]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Sanity Check]: End of testcase(s) at %d",$time);
endprogram

