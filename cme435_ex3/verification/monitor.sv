class monitor;
    // create virtual interface handle
    virtual intf vif;
    // create mailbox handle
    mailbox mon2scb;

    //constructor
    function new (virtual intf vif,mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task main;
        forever begin
            transaction trans;
            trans = new();
            @(posedge vif.clk);
            trans.op    = vif.op;
            trans.a     = vif.a;
            trans.b     = vif.b;
            @(posedge vif.clk);
            trans.y     = vif.y;
            mon2scb.put(trans);
            trans.display("[monitor]");
        end
    endtask
endclass