module addr_mux(addr, sel, ir_ad, pc_ad);
input [7:0] ir_ad, pc_ad;
input sel;
output [7:0] addr;
assign addr = (sel)? ir_ad:pc_ad;
endmodule
//选择信号为1，将寄存器输入地址加载到总线，否则将计数器中地址加载到总线
