class test_logical_shift_left;
  environment env;

  
  function new (environment env);
    this.env =env;
    env.gen.repeat_count = 10;
    env.gen.alu_opcode_in = 4;
    $display("[subtraction mode testing]: start of testcase(s) at %0d",$time);
  endfunction

endclass