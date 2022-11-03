program test_addition_overflow(intf i_intf);
  import lab3_pkg::*;
  environment env;
  a_b_bigger_255 trans;
  initial begin
    env = new(i_intf);
    trans = new();
    env.gen.placeholder = trans;
    env.gen.repeat_count = 10;
    env.gen.alu_opcode_in = 0;
    $display("[Test Addition Overflow]: start of testcase(s) at %0d",$time);
    env.run(); 
  end
  final
    $display("[Test Addition Overflow]: End of testcase(s) at %d",$time);
endprogram