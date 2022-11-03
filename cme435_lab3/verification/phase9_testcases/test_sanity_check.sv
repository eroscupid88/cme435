program test_sanity_check(intf i_intf);
import lab3_pkg::*;
  environment env;
  transaction trans;
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
    env.gen.alu_opcode_in = 0;
    // env.gen.alu_opcode_in = 1;
    // env.gen.alu_opcode_in = 2;
    // env.gen.alu_opcode_in = 3;
    // env.gen.alu_opcode_in = 4;
    // env.gen.alu_opcode_in = 5;
    // env.gen.alu_opcode_in = 6;
    // env.gen.alu_opcode_in = 7;
    // env.gen.alu_opcode_in = 8;
    // env.gen.alu_opcode_in = 9;
    // env.gen.alu_opcode_in = 10;
    // env.gen.alu_opcode_in = 11;
    // env.gen.alu_opcode_in = 12;
    // env.gen.alu_opcode_in = 13;
    // env.gen.alu_opcode_in = 14;
    // env.gen.alu_opcode_in = 15;
    


    $display("[Sanity Check]: start of sanity check at %0d with opcode alu_opcode_in: %d",$time,env.gen.alu_opcode_in);
    env.run();
  end

  final
    $display("[Sanity Check]: End of sanity check at %d",$time);
endprogram

