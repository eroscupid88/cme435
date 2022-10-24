class test_logical_shift_right;
  environment env;

  
  function new (environment env);
    this.env =env;
    env.gen.repeat_count = 10;
    env.gen.alu_opcode_in = 5;
    $display("[subtraction mode testing]: start of testcase(s) at %0d",$time);
  endfunction

endclass