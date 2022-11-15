class scoreboard;
    mailbox mon2scb;

    int no_transactions;

    int no_errors;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
        this.no_errors = 0;
    endfunction


    task main;
        transaction trans;
        forever begin
            mon2scb.get(trans);
            trans.display("[Scoreboard]");
            case (trans.alu_opcode_in)
                // addition
                0 : 
                begin 
                    if ((trans.alu_co_out == 0) && ((trans.alu_a_in + trans.alu_b_in)<=255) && ((trans.alu_a_in + trans.alu_b_in) == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else if ((trans.alu_co_out == 1) && ((trans.alu_a_in + trans.alu_b_in)>255)&& ((trans.alu_a_in + trans.alu_b_in) == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",(trans.alu_a_in+trans.alu_b_in),trans.alu_y_out);
                        no_errors++;
                        end
                end
                // subtraction
                1 :
                begin 
                    if ( ( trans.alu_a_in >= trans.alu_b_in ) && ((trans.alu_a_in - trans.alu_b_in)  == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else if ( ( trans.alu_a_in < trans.alu_b_in ) && ((trans.alu_a_in - trans.alu_b_in ) == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",(trans.alu_a_in-trans.alu_b_in),trans.alu_y_out);
                        no_errors++;
                        end
                end
                // multiplication
                2 :
                begin 
                    if ((trans.alu_co_out == 0) && ((trans.alu_a_in * trans.alu_b_in <= 255)) && (((trans.alu_a_in * trans.alu_b_in) & 8'hFF) == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else if ((trans.alu_co_out == 1) && ((trans.alu_a_in * trans.alu_b_in > 255)) && (((trans.alu_a_in * trans.alu_b_in) & 8'hFF) == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",((trans.alu_a_in*trans.alu_b_in) & 8'hFF),trans.alu_y_out);
                        no_errors++;
                        end
                end
                // division
                3 :
                begin 
                    if ((trans.alu_co_out == 0) && (trans.alu_a_in >= trans.alu_b_in ) && (int'(trans.alu_a_in / trans.alu_b_in) == trans.alu_y_out ))
                        begin
                        $display("[Scoreboard]: Pass");
                        end
                    else if ((trans.alu_co_out == 1) && (trans.alu_a_in < trans.alu_b_in ) && (int'(trans.alu_a_in / trans.alu_b_in) == trans.alu_y_out ))
                        begin
                        $display("[Scoreboard]: Pass");
                        end
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d\t%d",int'(trans.alu_a_in / trans.alu_b_in),trans.alu_y_out,trans.alu_co_out);
                        no_errors++;
                        end
                end
                //logic shift left
                4:
                begin 
                    if (((trans.alu_a_in * 2) & 255) == trans.alu_y_out )
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",(trans.alu_a_in * 2) & 255,trans.alu_y_out);
                        no_errors++;
                        end
                end
                //logic shift right
                5:
                begin 
                    if (((trans.alu_a_in / 2) & 255) == trans.alu_y_out )
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",(trans.alu_a_in / 2) & 255,trans.alu_y_out);
                        no_errors++;
                        end
                end
                //rotate left
                6:
                begin 
                    if ((trans.alu_a_in < 128 ) && (((trans.alu_a_in << 1) & 255) == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else if ((trans.alu_a_in >= 128 ) && ((((trans.alu_a_in << 1) + 1) & 255) == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",trans.alu_a_in >= 128 ? (((trans.alu_a_in << 1) + 1) & 255) : ((trans.alu_a_in << 1) & 255) ,trans.alu_y_out);
                        no_errors++;
                        end
                end

                //rotate right
                7:
                begin 
                    if ((trans.alu_a_in % 2 == 0) && (((trans.alu_a_in >> 1) & 255) == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else if ((trans.alu_a_in % 2 == 1 ) && ((((trans.alu_a_in >> 1) + 128) & 255) == trans.alu_y_out ))
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",trans.alu_a_in % 2 == 0 ? (trans.alu_a_in >> 1) & 255 : (((trans.alu_a_in >> 1) + 128) & 255),trans.alu_y_out);
                        no_errors++;
                        end
                end
                //logical AND
                8:
                begin
                    if ((trans.alu_a_in & trans.alu_b_in) == trans.alu_y_out)
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",trans.alu_a_in & trans.alu_b_in ,trans.alu_y_out);
                        no_errors++;
                        end
                end
                //logical OR
                9:
                begin
                    if ((trans.alu_a_in | trans.alu_b_in) == trans.alu_y_out)
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",trans.alu_a_in | trans.alu_b_in ,trans.alu_y_out);
                        no_errors++;
                        end
                end
                //logical XOR
                10:
                begin
                    if ((trans.alu_a_in ^ trans.alu_b_in) == trans.alu_y_out && (trans.alu_co_out == 0))
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",trans.alu_a_in ^ trans.alu_b_in ,trans.alu_y_out);
                        no_errors++;
                        end
                end
                //logical NOR
                11:
                begin
                    if (~(trans.alu_a_in | trans.alu_b_in) == trans.alu_y_out)
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",~(trans.alu_a_in | trans.alu_b_in) ,trans.alu_y_out);
                        no_errors++;
                        end
                end
                //logical NAND
                12:
                begin
                    if (~(trans.alu_a_in & trans.alu_b_in) == trans.alu_y_out)
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",~(trans.alu_a_in & trans.alu_b_in) ,trans.alu_y_out);
                        no_errors++;
                        end
                end
                //logical XNOR
                13:
                begin
                    if (~(trans.alu_a_in ^ trans.alu_b_in) == trans.alu_y_out)
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     %0d Received:   %d",~(trans.alu_a_in ^ trans.alu_b_in) ,trans.alu_y_out);
                        no_errors++;
                        end
                end
                //A>B
                14:
                begin
                    if ((trans.alu_a_in > trans.alu_b_in) == trans.alu_y_out)
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     \talu_a_in:%0d \n\t\t\talu_b_in:%0d",trans.alu_a_in , trans.alu_b_in);
                        no_errors++;
                        end
                end
                //A=B
                15:
                begin
                    if (((trans.alu_a_in == trans.alu_b_in) && trans.alu_y_out == 1) || ((trans.alu_a_in != trans.alu_b_in) && trans.alu_y_out == 0))
                        $display("[Scoreboard]: Pass");
                    else
                        begin
                        $display("[Scoreboard]: Error:  \n\Expected result:     \talu_a_in:%0d \n\t\t\talu_b_in:%0d \n\t\t\talu_co_out:%0d",trans.alu_a_in , trans.alu_b_in,trans.alu_co_out);
                        no_errors++;
                        end
                end
            endcase


            no_transactions++;
        end

    endtask

endclass