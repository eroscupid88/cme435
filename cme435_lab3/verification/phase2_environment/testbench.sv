
program testbench(intf i_intf);

  environment env;
  initial begin
    env = new(i_intf);
    $display("[Testbench]: start of testcase(s) at %0d",$time);
    env.run();
  end

  final
    $display("[Testbench]: End of testcase(s) at %d",$time);
endprogram