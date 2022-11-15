program test_nor(intf i_intf);
import lab3_pkg::*;
  environment env;
    a_smaller_than_b_constraints trans;
    // a_mutiply_b_smaller_255 trans;
  // a_or_b_odd trans;
  // a_or_b_even trans;
  // a_and_b_is_equal_0 trans;
  // a_or_b_is_0 trans;
  // a_is_zero trans;
  // b_is_zero trans;
  // a_smaller_than_b_constraints trans;
  // a_bigger_than_b_constraints trans;
  // a_b_bigger_255 trans;
  // a_is_equal_b_255 trans;
  // a_is_equal_b_255 trans;
  // a_or_b_is_255 trans;
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