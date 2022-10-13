class environment;
  
  // virtual interface
  virtual intf vif;

  //generator instance
  generator gen;
  // driver instance
  driver driv;

  //monitor instance
  monitor monitor;

  //scoreboard instance
  scoreboard  scoreboard;

  //mailbox handlers
  mailbox gen2driv;
  mailbox mon2scb;
  
  // constructor
  function new(virtual intf vif);
    // get the interface from test
    this.vif = vif;
    //create mailbox(es) fro data exchange
    gen2driv = new();
    mon2scb = new();
    // create generator
    // gen =new();
    gen = new(gen2driv);
    driv = new(vif,gen2driv);
    monitor = new(vif,mon2scb);
    scoreboard =  new(mon2scb);
    
  
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
      monitor.main();
      scoreboard.main();
    // join
    join_any
    wait(gen.ended.triggered);
    wait(gen.repeat_count== driv.no_transaction);
    // wait(gen.repeat_count ==scoreboard.no_transaction);
    $display("[Environment]: End of test() at %0d",$time);
  endtask

  task post_test();
    $display("[Environment]: Start of post_test() at %0d",$time);
    $display("[Environment]: End of post_test() at %0d",$time);
  endtask

  task reset;
    wait(vif.reset);
    $display("[Environment]: Reset started at %0d",$time);
    vif.en <=0;
    vif.op <=0;
    vif.a  <=0;
    vif.b  <=0;
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