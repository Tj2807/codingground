module addAndMul(
    k1,
    k2,
    k3,
    a,
    y,
    overflow);

input[2:0] k1,k2,k3;
input[7:0] a;
output[7:0] y,overflow;
wire[7:0] y,overflow;

assign {overflow,y} = a*(raiseTo(010,k1-k3) + raiseTo(010,k2-k3));

//assume k1 and k2 are greater than k3

function raiseTo;
    input[2:0] base,power;
    integer i;
    begin
        raiseTo =1;
        for(i=0;i<power;i=i+1)
        begin
            raiseTo = raiseTo*base;
        end
    end
endfunction

endmodule

module test_adder;
reg[2:0] k1,k2,k3;
reg[7:0] a;
wire[7:0] y,overflow;

initial 
begin
    a=8'b00000101;
    k1=3'b011;
    k2=3'b011;
    k3=3'b011;
    $monitor("Overflow + Y:%b %b",overflow,y);
end

addAndMul obj(
.k1(k1),
.k2(k2),
.k3(k3),
.y(y),
.overflow(overflow),
.a(a));

endmodule
    