program testbench(intf i_intf);
  environment env;
  test_sanity_check test_sanity_check;
  test_addition test_addition;
  test_subtraction test_subtraction;
  test_multiplication test_multiplication;
  test_division test_division;
  test_logical_shift_left test_logical_shift_left;
  test_logical_shift_right test_logical_shift_right;
  test_rotate_left test_rotate_left;
  test_rotate_right test_rotate_right;
  test_and test_and;
  test_or test_or;
  test_xor test_xor;
  test_nor test_nor;
  test_nand test_nand;
  test_xnor test_xnor;
  test_A_bigger_B test_A_bigger_B;
  test_A_equal_B test_A_equal_B;



/***
To run each test case, enable enviroment, test case class and env.run()
*/
  initial begin
    // env = new(i_intf);
    // test_sanity_check = new(env);
    // env.run();

    // env = new(i_intf);
    // test_addition = new(env);
    // env.run();

    // env = new(i_intf);
    // test_subtraction = new(env);
    // env.run();

    // env = new(i_intf);
    // test_multiplication = new(env);
    // env.run();

    // env = new(i_intf);
    // test_division = new(env);
    // env.run();

    // env = new(i_intf);
    // test_logical_shift_left = new(env);
    // env.run();

    // env = new(i_intf);
    // test_logical_shift_right = new(env);
    // env.run();

    // env = new(i_intf);
    // test_rotate_left = new(env);
    // env.run();

    // env = new(i_intf);
    // test_rotate_right = new(env);
    // env.run();
    
    // env = new(i_intf);
    // test_and = new(env);
    // env.run();

    // env = new(i_intf);
    // test_or = new(env);
    // env.run();

    // env = new(i_intf);
    // test_xor = new(env);
    // env.run();

    // env = new(i_intf);
    // test_nor = new(env);
    // env.run();

    env = new(i_intf);
    test_nand = new(env);
    env.run();

    // env = new(i_intf);
    // test_xnor = new(env);
    // env.run();

    // env = new(i_intf);
    // test_A_bigger_B = new(env);
    // env.run();

    // env = new(i_intf);
    // test_A_equal_B = new(env);
    // env.run();
  end

  final
    $display("[Testbench]: End of testcase(s) at %d",$time);
endprogram