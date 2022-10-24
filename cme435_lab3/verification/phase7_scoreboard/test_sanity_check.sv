class test_sanity_check;
  environment env;

  
  function new (environment env);
    this.env =env;
    env.gen.repeat_count = 10;
    env.gen.alu_opcode_in = 15;
    $display("[sanity check testing]: start of testcase(s) at %0d",$time);
  endfunction

endclass