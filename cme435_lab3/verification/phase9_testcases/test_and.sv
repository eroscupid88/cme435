program test_and(intf i_intf);
import lab3_pkg::*;
  environment env;
  transaction trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 30000;
    env.gen.alu_opcode_in = 8;

    $display("[Test Logical AND]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Test Logical AND]: End of testcase(s) at %d",$time);
endprogram