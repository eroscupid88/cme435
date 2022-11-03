program test_rotate_left(intf i_intf);
import lab3_pkg::*;
  environment env;
  a_or_b_is_0 trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 30000;
    env.gen.alu_opcode_in = 6;

    $display("[Test Rotate Left]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Test Rotate Left]: End of testcase(s) at %d",$time);
endprogram