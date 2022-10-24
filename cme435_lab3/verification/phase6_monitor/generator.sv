class generator;

//  declare transaction class
    transaction trans;
    //repeat count, to specify number of items to generate
    int repeat_count;

    event ended;

    bit [3:0]alu_opcode_in;

    mailbox gen2driv;

    function new(mailbox gen2driv);
        this.gen2driv = gen2driv;
    endfunction

    //main task to generate (create and randomize) transaction packets
    task main();
        repeat (repeat_count) begin
            trans = new();
            if(!trans.randomize()) $fatal("Gen:: trans randomization failed");
            trans.display("[Generator]");
            trans.alu_opcode_in = alu_opcode_in;
            gen2driv.put(trans);    
    end
    -> ended;

    endtask
endclass