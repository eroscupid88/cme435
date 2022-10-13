// `include "environment.sv"
program testbench(intf i_intf);


//declare environment instance
    environment env;
  initial begin
    //construct environment
    env = new(i_intf);
    $display("[Testbench]: start of testcase(s) at %0d",$time);
    env.gen.repeat_count = 4;
    env.run();
  end

  final
    $display("[Testbench]: End of testcase(s) at %d",$time);
endprogram