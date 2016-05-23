module MulAndAdd(
    k1,
    k2,
    k3,
    a,
    y
    );

    input [7:0] a;
    input [2:0] k1,k2,k3;
    output [7:0] y;
    integer b;
    initial begin
        b=2;
    end
    
    assign y= a*(raiseTo(b, k1-k3) + raiseTo(b, k2-k3));
    
    function[7:0] raiseTo;
        input[2:0] base,power;
        integer i;
        integer o;
        begin
            raiseTo=1;
            for(i=0;i<power;i++)
            begin
                raiseTo = raiseTo*base;
            end
        end
    endfunction
endmodule