class environment;
  
  // virtual interface
  virtual intf vif;

  driver driv;

  monitor mon;
  
  generator gen;

  mailbox gen2driv;

  scoreboard scb;

  mailbox mon2scb;

  // constructor
  function new(virtual intf vif);
    // get the interface from test
    this.vif = vif;
    gen2driv = new();
    mon2scb = new();
    gen = new(gen2driv);
    driv = new(vif.driv_intf, gen2driv);
    mon = new(vif.mon_intf,mon2scb);
    scb = new(mon2scb);

  
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
      mon.main();
      scb.main();
    join_any
    wait(gen.ended.triggered);
    wait(gen.repeat_count == driv.no_transactions);
    wait(gen.repeat_count == scb.no_transactions);
    $display("[Environment]: End of test() at %0d",$time);
  endtask

  task post_test();
    $display("[Environment]: Start of post_test() at %0d",$time);
    $display("[Environment]: End of post_test() at %0d",$time);
    $display("[Sanity check]: \t************************There are %0d errors**********************",scb.no_errors);
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