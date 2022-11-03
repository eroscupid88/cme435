program test_division(intf i_intf);
import lab3_pkg::*;
  environment env;
  a_or_b_is_0 trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 30000;
    env.gen.alu_opcode_in = 3;

    $display("[Test Division]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Test Division]: End of testcase(s) at %d",$time);
endprogram