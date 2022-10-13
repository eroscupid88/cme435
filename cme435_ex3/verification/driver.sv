class driver;
    // count the number of transactions
    int no_transaction;
    // create virture interface handle
    virtual intf vif;
    //create mailbox handle
    mailbox gen2driv;
    

    //constructor
    function new(virtual intf vif,mailbox gen2driv);
        this.vif = vif;
        this.gen2driv=gen2driv;
    endfunction

    //drive the transaction items to interface signals
    task main;
        forever begin
            transaction trans;
            gen2driv.get(trans);
            // drive the packets to interface signals
            @(posedge vif.clk);
            vif.en  <=  1;
            vif.op  <= trans.op;
            vif.a   <= trans.a;
            vif.b   <= trans.b;
            @(posedge vif.clk);
            vif.en  <= 0;
            @(posedge vif.clk);
            trans.display("[Driver]");  
            no_transaction++;    
        end
    endtask
endclass