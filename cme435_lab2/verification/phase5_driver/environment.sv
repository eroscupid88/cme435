class environment;
  
  // virtual interface
  virtual intf vif;

  driver driv;
  
  generator gen;

  mailbox gen2driv;

  // constructor
  function new(virtual intf vif);
    // get the interface from test
    this.vif = vif;
    gen2driv = new();
    gen = new(gen2driv);
    driv = new(vif.driv_intf, gen2driv);

  
  endfunction
  task pre_test();
    $display("[Environment]: Start of pre_test() at %0d",$time);
    reset();
    $display("[Environment]: End of pre_test() at %0d",$time);
  endtask

  task test();
    $display("[Environment]: Start of test() at %0d",$time);
    fork
      gen.main();
      driv.main();
    join_any
    wait(gen.ended.triggered);
    wait(gen.repeat_count == driv.no_transactions);
    $display("[Environment]: End of test() at %0d",$time);
  endtask

  task post_test();
    $display("[Environment]: Start of post_test() at %0d",$time);
    $display("[Environment]: End of post_test() at %0d",$time);
  endtask

  task reset;
    wait(vif.reset);
    $display("[Environment]: Reset started at %0d",$time);
    vif.alu_opcode_in <=0;
    vif.alu_a_in  <=0;
    vif.alu_b_in  <=0;
    wait(!vif.reset);
    $display("[Environment]: Reset ended at %0d",$time);
  endtask


  //run task

    task run;
      $display("[Environment]: Start of run() at %0d",$time);
      pre_test();
      test();
      post_test();
      $display("[Environment]: End of run() at %0d",$time);
      $finish;
    endtask


endclass