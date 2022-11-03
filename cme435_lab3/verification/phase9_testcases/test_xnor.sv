program test_xnor(intf i_intf);
import lab3_pkg::*;
  environment env;
  transaction trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 30000;
    env.gen.alu_opcode_in = 13;

    $display("[Test Logical XNOR]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Test Logical XNOR]: End of testcase(s) at %d",$time);
endprogram