module ins_reg(data, fetch, clk, rst, ins, ad1, ad2);
input clk, rst;
input [1:0] fetch;
input [7:0] data;
output [2:0] ins;
output [4:0] ad1;
output [7:0] ad2;
reg [7:0] ins_p1, ins_p2;
reg [2:0] state;
  assign ins = ins_p1[7:5]; //高3位为指令编码
  assign ad1 = ins_p1[4:0]; //低5位为通用寄存器地址
assign ad2 = ins_p2;
always @(posedge clk or negedge rst) begin
if(!rst) begin
ins_p1 <= 8'd0;
ins_p2 <= 8'd0;
end
else begin
  if(fetch==2'b01) begin //输入控制信号为01，表示当前数据总线上为指令，将其从ins和ad1输出
ins_p1 <= data;
ins_p2 <= ins_p2;
end
  else if(fetch==2'b10) begin //输入控制信号为10，表示当前数据总线上为数据，将其从ad2输出到地址选择器
ins_p1 <= ins_p1;
ins_p2 <= data;
end
else begin
ins_p1 <= ins_p1;
ins_p2 <= ins_p2;
end
end
end
endmodule
