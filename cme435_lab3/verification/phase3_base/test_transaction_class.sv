program test_transaction_class;
    import lab3_pkg::*;

    a_bigger_than_b_constraints trans;
    a_smaller_than_b_constraints trans1;
    a_or_b_is_0 trans2;
    a_is_equal_b_255 trans3;
    a_or_b_even trans4;
    a_or_b_odd trans5;
    a_and_b_is_equal_0 trans6;
    initial begin
        trans = new();
        trans1 = new();
        trans2 = new();
        trans3 = new();
        trans4 = new();
        trans5 = new();
        trans6 = new();
        repeat (20) begin
            if(!trans.randomize()) $fatal(1,"test::trans: Randomization failed");
            trans.display("[test_transaction_class a_bigger_than_b_constraints]");
            if(!trans1.randomize()) $fatal(1,"test::trans: Randomization failed");
            trans1.display("[test_transaction_class a_smaller_than_b_constraints]");
            if(!trans2.randomize()) $fatal(1,"test::trans: Randomization failed");
            trans2.display("[test_transaction_class a or b is zero]");
            if(!trans3.randomize()) $fatal(1,"test::trans: Randomization failed");
            trans3.display("[test_transaction_class a=b=255]");
            if(!trans4.randomize()) $fatal(1,"test::trans: Randomization failed");
            trans4.display("[test_transaction_class a or b is even]");
            if(!trans5.randomize()) $fatal(1,"test::trans: Randomization failed");
            trans5.display("[test_transaction_class a or b is odd]");
            if(!trans6.randomize()) $fatal(1,"test::trans: Randomization failed");
            trans6.display("[test_transaction_class a and b is zero]");
        end
    end
endprogram: test_transaction_class