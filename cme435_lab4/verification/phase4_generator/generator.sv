import lab4_pkg::*;
class generator;
    
//  declare transaction class
    a_bigger_than_b_constraints placeholder;
    //repeat count, to specify number of items to generate
    int repeat_count;

    bit [3:0]alu_opcode_in;

    mailbox gen2driv;
    function new(mailbox gen2driv);
        this.gen2driv = gen2driv;
    endfunction

    //main task to generate (create and randomize) transaction packets
    task main();
        placeholder = new();
        repeat (repeat_count) begin
            if(!placeholder.randomize()) $fatal("Gen:: trans randomization failed");
            placeholder.display("[Generator]");
            placeholder.alu_opcode_in = alu_opcode_in;
            gen2driv.put(placeholder);    
    end

    endtask
endclass