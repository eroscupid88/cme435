program test_logical_shift_right(intf i_intf);
import lab3_pkg::*;
  environment env;
  transaction trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 10000;
    env.gen.alu_opcode_in = 5;

    $display("[Test Logical Shift Right]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Test Logical Shift Right]: End of testcase(s) at %d",$time);
endprogram