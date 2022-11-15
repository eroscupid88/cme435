package lab3_pkg;
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
  endclass: transaction

  
  class a_or_b_is_255 extends transaction;
    constraint one_is_255 { (alu_a_in == 255 || alu_b_in == 255);}
  endclass: a_or_b_is_255

  class a_is_equal_b_255 extends a_or_b_is_255;
    constraint constraint1 {alu_a_in == alu_b_in;}

  endclass :a_is_equal_b_255

  class a_b_bigger_255 extends transaction;
    constraint overflow_c {alu_a_in + alu_b_in > 255 ;}
  endclass

  class a_bigger_than_b_constraints extends transaction;
    constraint alu_a_in_range { alu_a_in > alu_b_in ;}
  endclass

  class a_smaller_than_b_constraints extends transaction;
    constraint alu_a_in_range { alu_a_in < alu_b_in ;}
  endclass:a_smaller_than_b_constraints

  class b_is_zero extends transaction;
    constraint alu_a_in_range { alu_b_in == 0;};
  endclass
  
  class a_is_zero extends transaction;
    constraint alu_a_in_range { alu_a_in == 0;};
  endclass


 class a_or_b_is_0 extends transaction;
    constraint one_is_255 { (alu_a_in == 0 || alu_b_in == 0);}
  endclass

  class a_and_b_is_equal_0 extends a_or_b_is_0;
    constraint alu_a_in_range { alu_a_in == alu_b_in;};
  endclass

  class a_or_b_even extends transaction;
    constraint alu_a_in_range { alu_a_in % 2 == 0 || alu_b_in % 2 == 0;};
  endclass

  class a_or_b_odd extends transaction;
    constraint alu_a_in_range { alu_a_in % 2 == 1 || alu_b_in % 2 == 1;};
  endclass

  class a_mutiply_b_smaller_255 extends transaction;
    constraint alu_a_in_range { alu_a_in* alu_b_in < 255;};
  endclass
 

 
  
  
  

endpackage

