class test_sanity_check;
  environment env;

  
  function new (environment env);
    this.env =env;
    env.gen.repeat_count = 6;
    env.gen.alu_opcode_in = 0;
    $display("[sanity check]: start of testcase(s) at %0d",$time);
  endfunction

endclass