class transaction;
    rand bit [7:0] alu_a_in;
    rand bit [7:0] alu_b_in;
         bit [3:0] alu_opcode_in;
         bit [7:0] alu_y_out;
         bit alu_co_out;
    function void display(string name);
        $display("----------------------------");
        $display("\t%s: alu_a_in = %0d, alu_b_in = %0d",name,alu_a_in,alu_b_in);
        $display("\t%s: alu_opcode_in = %0d, alu_y_out = %0d, alu_co_out = %0d",name,alu_opcode_in,alu_y_out,alu_co_out);
    endfunction

endclass

