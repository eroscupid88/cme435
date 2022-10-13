class transaction;
        bit         op;
rand    bit [3:0]   a;
rand    bit [3:0]   b;
        bit [7:0]   y;

    function void display(string name);
        $display("----------------------------");
        $display("\t%s: a = %0d, b = %0d",name,a,b);
        $display("\t%s: op = %0d, y = %0d",name,op,y);
    endfunction


endclass