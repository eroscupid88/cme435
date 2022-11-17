class environment#(type T = transaction);
  
  // virtual interface
  virtual intf vif;

  driver #(T) driv;

  monitor #(T)mon;
  
  generator #(T)gen;

  mailbox gen2driv;

  scoreboard #(T)scb;

  mailbox mon2scb;

  coverage #(T) co;

  // constructor
  function new(virtual intf vif);
    // get the interface from test
    this.vif = vif;
    this.gen2driv = new();
    this.mon2scb = new();
    this.co = new();
    this.gen = new(gen2driv);
    this.driv = new(vif.driv_intf, gen2driv);
    this.mon = new(vif.mon_intf,mon2scb,co);
    this.scb = new(mon2scb,vif.mon_intf);

  
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
    $display("[Functional Coverage]***************** \n\t\tCoverage for input_data_coverage group= %0.2f %%",co.input_data_coverage.get_inst_coverage());
    $display("\n\t\tCoverage for input_alu_in_toggle group= %0.2f %%",co.input_alu_in_toggle.get_inst_coverage());
    $display("\n\t\tCoverage for transition_cg group= %0.2f %%",co.transition_cg.get_inst_coverage());
    $display("\n\t\tCoverage for cg_reset group= %0.2f %%",co.cg_reset.get_inst_coverage());
    $display("\n\t\tCoverage for cg_min_max_value group= %0.2f %%",co.cg_min_max_value.get_inst_coverage());
    $display("\n\t\tCoverage for cg_alu_co_out group= %0.2f %%",co.cg_alu_co_out.get_inst_coverage());
    
    
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