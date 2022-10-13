program testbench(intf i_intf);
  environment env;
  test_sanity_check test_sanity_check;

  initial begin
    env = new(i_intf);
    test_sanity_check = new(env);
    $display("[sanity check]: \t\tStart sanity check");
    env.run();
    $display("[sanity check] erorr is  %d",env.scb.no_errors);
  end

  final
    $display("[Testbench]: End of testcase(s) at %d",$time);
endprogram