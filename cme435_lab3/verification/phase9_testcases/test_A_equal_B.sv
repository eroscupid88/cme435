program test_A_equal_B(intf i_intf);
import lab3_pkg::*;
  environment env;
  a_and_b_is_equal_0 trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 10;
    env.gen.alu_opcode_in = 15;

    $display("[Test A equal B]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Test A equal B]: End of testcase(s) at %d",$time);
endprogram