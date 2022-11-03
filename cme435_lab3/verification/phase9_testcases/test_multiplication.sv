program test_multiplication(intf i_intf);
import lab3_pkg::*;
  environment env;
  a_mutiply_b_smaller_255 trans;
  initial begin
    trans = new();
    env = new(i_intf);
    env.gen.placeholder = trans;
    env.gen.repeat_count = 30001;
    env.gen.alu_opcode_in = 2;

    $display("[Test Multiplication]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Test Multiplication]: End of testcase(s) at %d",$time);
endprogram