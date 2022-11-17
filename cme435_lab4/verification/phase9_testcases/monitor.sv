class monitor # (type T = transaction);
    virtual intf vif;
    mailbox mon2scb;
    coverage #(T) co;
    function new(virtual intf vif,mailbox mon2scb,coverage co);
        this.vif = vif;
        this.mon2scb=mon2scb;
        this.co = co;
    endfunction

    task main;
        @(posedge vif.clk);
        forever begin
            T trans;
            trans = new();
            @(posedge vif.clk);
                trans.alu_opcode_in = vif.alu_opcode_in;
                trans.alu_a_in = vif.alu_a_in;
                trans.alu_b_in = vif.alu_b_in;
            @(posedge vif.clk);
                trans.alu_y_out = vif.alu_y_out;
                trans.alu_co_out = vif.alu_co_out;
            mon2scb.put(trans);
            co.sample(trans,vif.reset);
            trans.display("[Monitor]");
        end
    endtask

endclass