module reg_32(in, data, write, read, addr, clk);
input write, read, clk;
input [7:0] in;
input [7:0] addr; 
output [7:0] data;
reg [7:0] R[31:0]; 
wire [4:0] r_addr;
assign r_addr = addr[4:0];
assign data = (read)? R[r_addr]:8'hzz;
always @(posedge clk) begin				
	if(write)  R[r_addr] <= in; 
end
endmodule
//写信号有效时，从alu输出数据输入存储器，存储到寄存及特定地址；读信号有效时候，寄存器数据输出到总线。
