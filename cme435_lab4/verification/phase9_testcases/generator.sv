import lab4_pkg::*;
class generator #(type T = transaction);

//  declare transaction class
    rand T placeholder;
    //repeat count, to specify number of items to generate
    int repeat_count;

    event ended;

    bit [3:0]alu_opcode_in;

    bit reset_in;

    mailbox gen2driv;

    function new(mailbox gen2driv); 
        this.gen2driv = gen2driv;
    endfunction

    //main task to generate (create and randomize) transaction packets
    task main();
        repeat (repeat_count) begin
            placeholder = new();
            if(!placeholder.randomize()) $fatal("Gen:: trans randomization failed");
            placeholder.display("[Generator]");
            gen2driv.put(placeholder);
    end
    -> ended;

    endtask
endclass