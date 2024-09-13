  module ram(data, addr, ena, read, write);
   input ena, read, write;
   input [7:0] addr;
   input [7:0] data;
 
   reg [7:0] ram[255:0];
 
   assign data = (read&&ena)? ram[addr]:8'hzz;     
   always @(posedge write) begin   
       ram[addr] <= data;
   end
   endmodule
//读信号和使能信号ena有效时，输出对应地址存储数据，写信号有效时，输入和输出写入对应地址。
