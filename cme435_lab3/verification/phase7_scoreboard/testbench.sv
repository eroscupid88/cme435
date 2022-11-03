program testbench(intf i_intf);
  environment env;

  initial begin
    env = new(i_intf);
    
    $display("[sanity check]: \t\tStart sanity check");
    env.run();
    $display("[sanity check] erorr is  %d",env.scb.no_errors);
  end

  final
    $display("[Testbench]: End of testcase(s) at %d",$time);
endprogram