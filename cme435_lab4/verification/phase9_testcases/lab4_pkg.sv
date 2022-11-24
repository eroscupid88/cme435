
package lab4_pkg;
  import globals::*;
  class transaction;
    rand bit [7:0] alu_a_in;
    rand bit [7:0] alu_b_in;
    rand bit [3:0] alu_opcode_in;
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

  class coverage#(type T = transaction);
    T trans;
    bit reset;

    function op_code instr_mnemonic([3:0]alu_opcode_in);
        case (alu_opcode_in)
            0: return ADD;
            1: return SUB;
            2: return MUL;
            3: return DIV;
            4: return LSL;
            5: return LSR;
            6: return RL;
            7: return RR;
            8: return AND;
            9: return OR;
            10: return XOR;
            11: return NOR;
            12: return NOR;
            13: return NAND;
            14: return A_COMP_B;
            15: return A_EQL_B;

        endcase
    endfunction

    covergroup input_data_coverage;
        option.per_instance = 1;
        option.at_least = 3;
        coverage_point_opcode : coverpoint instr_mnemonic(trans.alu_opcode_in) iff(reset ==0);
        
        coverage_point_alu_a : coverpoint trans.alu_a_in iff(reset ==0){
          
          bins low = {[1:10]};
          bins med_low = {[10:51]}; 
          bins med_high = {[51:100]};
          bins high_low = {[100:200]};
          bins high_med = {[150:200]};
          bins high_hight = {[200:254]};
          
        }
        coverage_point_alu_b : coverpoint trans.alu_b_in iff(reset ==0){
         
          bins low = {[1:10]};
          bins med_low = {[10:51]}; 
          bins med_high = {[51:100]};
          bins high_low = {[100:200]};
          bins high_med = {[150:200]};
          bins high_hight = {[200:255]};
        
        }
        coverage_transition :coverpoint trans.alu_opcode_in iff(reset ==0){
          bins transition_cov[] = (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 => 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
        } 
        cross coverage_point_opcode, coverage_point_alu_a, coverage_point_alu_b;
    endgroup
    covergroup cg_min_max_value;
        option.per_instance = 1;
        coverage_point_alu_a_min_max : coverpoint trans.alu_a_in iff(reset ==0){
          bins value_0 = {0};
          bins value_255 = {255};
        }
        coverage_point_alu_b_min_max : coverpoint trans.alu_b_in iff(reset ==0){
          bins value_0 = {0};
          bins value_255 = {255};
        }
    endgroup

    covergroup transition_cg;
      coverage_transition :coverpoint trans.alu_opcode_in iff(reset ==0){
          bins transition_cov[] = (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 => 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
        }
    endgroup

    covergroup cg_reset;
      coverpoint reset {
        bins value[2] ={[0:1]};
      }
    endgroup

    covergroup cg_alu_co_out;
      coverpoint trans.alu_co_out iff(reset ==0){
        bins value[] ={[0:1]};
      }
    endgroup

    covergroup  input_alu_in_toggle with function sample(int bit_num, bit bit_val);
      coverpoint bit_val iff(reset ==0){
        bins value[] ={0,1};      
      }
      coverpoint bit_num iff(reset ==0){
        bins bit_number[] = {[0:7]};
      }
      coverage_point_opcode : coverpoint instr_mnemonic(trans.alu_opcode_in) iff(reset ==0);
      cp_bit_and_val_opcode: cross coverage_point_opcode,bit_num, bit_val;
    endgroup

    function void cov_value_toggles(bit [7:0] value);
      for (int i=0; i< 8; i++) begin
        input_alu_in_toggle.sample(i,value[i]);
      end
    endfunction

    function new();
      input_data_coverage =new();
      input_alu_in_toggle = new();
      transition_cg =new();
      cg_reset = new();
      cg_min_max_value = new();
      cg_alu_co_out = new();
    endfunction

    task sample(T trans,bit reset);
      this.trans = trans;
      this.reset = reset;
      input_data_coverage.sample();
      cov_value_toggles(trans.alu_a_in);
      cov_value_toggles(trans.alu_b_in);
      cg_reset.sample();
      transition_cg.sample();
      cg_min_max_value.sample();
      cov_value_toggles(trans.alu_y_out);
      cg_alu_co_out.sample();
    endtask : sample



    
endclass: coverage
 

 
  
  
  

endpackage

