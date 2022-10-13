`include "transaction.sv"
program test_transaction_class;
    transaction trans;

    initial begin
        trans = new();
        repeat (20) begin
            if(!trans.randomize()) $fatal("Gen:: trans randomization failed");
            trans.display("[test_transaction_class]");
        end
    end
endprogram: test_transaction_class