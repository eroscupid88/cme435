class generator;

//  declare transaction class
    transaction trans;
    bit op_code ;

    //event to indicate the end of transaction generation
    event ended;

    //repeat count, to specify number of items to generate
    int repeat_count;

    // mailbox for sending packets to the driver
    mailbox gen2driv;
    //create constructor
    function new (mailbox gen2driv);
        this.gen2driv = gen2driv;
        op_code =1'b0;
    endfunction


    //main task to generate (create and randomize) transaction packets
    task main();
        repeat (repeat_count) begin
            trans = new();
            if(!trans.randomize()) $fatal("Gen:: trans randomization failed");
            trans.op = op_code;
            
            trans.display("[Generator]");
            gen2driv.put(trans);
    end
    -> ended;
        
    endtask
endclass