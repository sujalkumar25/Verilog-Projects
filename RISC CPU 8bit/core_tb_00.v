`timescale 1ps / 1ps
module core_tb_00 ;
reg rst ;
reg clk ;
core DUT (
.rst (rst ) ,
.clk (clk ) );

initial begin
clk = 0;
forever #50 clk = ~clk;
end

initial begin
rst = 1'b0;
# 100;
rst=1'b1;
# 9000;
end
initial
#20000 $stop;
endmodule
