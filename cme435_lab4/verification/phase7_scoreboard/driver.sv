import lab3_pkg::*;
class driver;
    virtual intf vif;

    int no_transactions;

    mailbox gen2driv;
    function new(virtual intf vif, mailbox gen2driv);
        this.gen2driv = gen2driv;
        this.vif = vif;
    endfunction

    task main;
        forever begin
            transaction trans;
            gen2driv.get(trans);
            @(posedge vif.clk);
            vif.alu_a_in <= trans.alu_a_in;
            vif.alu_b_in <= trans.alu_b_in;
            vif.alu_opcode_in <= trans.alu_opcode_in;
            @(posedge vif.clk);
            trans.display("[Driver]");
            no_transactions++;

        end
    endtask

endclass