`ifndef GLOBALS
`define GLOBALS
package globals;
    typedef enum {
        ADD,SUB,MUL,DIV, LSL,LSR,RL, RR, AND,OR,XOR,NOR,NAND,A_COMP_B,A_EQL_B
    } op_code;
endpackage

`endif