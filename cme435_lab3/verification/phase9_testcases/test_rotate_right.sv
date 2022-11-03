program test_rotate_right(intf i_intf);
import lab3_pkg::*;
  environment env;
  b_is_zero trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 30000;
    env.gen.alu_opcode_in = 7;

    $display("[Test Rotate Right]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Test Rotate Right]: End of testcase(s) at %d",$time);
endprogram