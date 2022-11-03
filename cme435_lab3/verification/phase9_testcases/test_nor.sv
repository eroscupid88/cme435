program test_nor(intf i_intf);
import lab3_pkg::*;
  environment env;
    a_smaller_than_b_constraints trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 10;
    env.gen.alu_opcode_in = 11;

    $display("[Test Logical NOR]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Test Logical NOR]: End of testcase(s) at %d",$time);
endprogram