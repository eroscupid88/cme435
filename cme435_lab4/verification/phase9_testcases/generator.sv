import lab4_pkg::*;
class generator;

//  declare transaction class
    transaction placeholder,trans_copy;
    //repeat count, to specify number of items to generate
    int repeat_count;

    event ended;

    bit [3:0]alu_opcode_in;

    bit reset_in;

    mailbox gen2driv;

    function new(mailbox gen2driv);
        placeholder = new();
        this.gen2driv = gen2driv;
    endfunction

    //main task to generate (create and randomize) transaction packets
    task main();
        repeat (repeat_count) begin
            if(!placeholder.randomize()) $fatal("Gen:: trans randomization failed");
            placeholder.display("[Generator]");
            placeholder.alu_opcode_in = alu_opcode_in;
            trans_copy = new placeholder;
            gen2driv.put(trans_copy);
    end
    -> ended;

    endtask
endclass