class monitor;
    virtual intf vif;
    mailbox mon2scb;
    function new(virtual intf vif,mailbox mon2scb);
        this.vif = vif;
        this.mon2scb=mon2scb;
    endfunction

    task main;
        @(posedge vif.clk);
        forever begin
            transaction trans;
            trans = new();
            @(posedge vif.clk);
                trans.alu_opcode_in = vif.alu_opcode_in;
                trans.alu_a_in = vif.alu_a_in;
                trans.alu_b_in = vif.alu_b_in;
            @(posedge vif.clk);
                trans.alu_y_out = vif.alu_y_out;
                trans.alu_co_out = vif.alu_co_out;
            mon2scb.put(trans);
            trans.display("[Monitor]");
        end
    endtask

endclass