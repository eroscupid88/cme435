class scoreboard;
    // create mailbox handle
    mailbox mon2scb;

    // count the number of transactions
    int no_transaction;

    //constructor
    function new(mailbox mon2scb);
        this.mon2scb =   mon2scb;
    endfunction

    task main;
        transaction trans;
        forever begin
            mon2scb.get(trans);
            trans.display("[Scoreboard]");
            if((trans.a +trans.b) ==trans.y)
            $display("[Scoreboard]: Pass");
            else
            $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",(trans.a+trans.b),trans.y);
            no_transaction++;
        end
    
    endtask
endclass