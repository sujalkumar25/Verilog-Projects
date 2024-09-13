`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 10:10:27
// Design Name: 
// Module Name: Street_light_fsm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Street_Light_FSM(clk,rst,LED_N,LED_E,LED_S,LED_W,LED_WALK);
input clk,rst;
output reg [2:0]LED_N,LED_E,LED_WALK,LED_S,LED_W;
parameter s0=4'd0;//N=RED E=RED S=RED W=RED F=GREEN
parameter s1=4'd1;//N=YELLOW E=RED S=RED W=RED F=YELLOW
parameter s2=4'd2;//N=GREEN E=RED S=RED W=RED F=RED
parameter s3=4'd3;//N=YELLOW E=YELLOW S=RED W=RED F=RED
parameter s4=4'd4;//N=RED E=GREEN S=RED W=RED F=RED
parameter s5=4'd5;//N=RED E=YELLOW S=YELLOW W=RED F=RED
parameter s6=4'd6;//N=RED E=RED S=GREEN W=RED F=RED
parameter s7=4'd7;//N=RED E=RED S=YELLOW W=YELLOW F=RED
parameter s8=4'd8;//N=RED E=RED S=RED W=GREEN F=RED
parameter s9=4'd9;//N=RED E=RED S=RED W=YELLOW F=YELLOW
reg[3:0]state;
reg[3:0]count;
reg [23:0]a;
reg clk_div;
always@(posedge clk or posedge rst )

begin
if (rst)
begin
a<=24'd0;
clk_div<=0;
end
else
begin
a<=a+24'd1;
clk_div<=a[23];
end
end


always@( posedge clk_div or posedge rst)
begin
if(rst==1)
begin
count = 4'b0000;
state = 4'b0000;
LED_S = 3'b100;
LED_E = 3'b100;
LED_WALK = 3'b100;
LED_N = 3'b100;
LED_W = 3'b100;
end
else
begin
case(state)
s0:begin
	if(count == 4'd10)
	begin
	count <=0;
	state <=s1;
	end
	else
	begin
	count <= count+1;
	state <=s0;
LED_S <= 3'b100;
LED_E <= 3'b100;
LED_WALK <= 3'b010;
LED_N <= 3'b100;
LED_W <= 3'b100;
	end
end 
s1:begin
	if(count == 4'd5)
	begin
	count <= 0;
	state <= s2;
	end
	else
	begin
	count = count+1;
	state = s1;
LED_S <= 3'b100;
LED_E <= 3'b100;
LED_WALK <= 3'b001;
LED_N <= 3'b001;
LED_W <= 3'b100;
	end
end 
s2:begin
	if(count == 4'd15)
	begin
	count <= 0;
	state <= s3;
	end
	else
	begin
	count = count+1;
	state = s2;
LED_S <= 3'b100;
LED_E <= 3'b100;
LED_WALK <= 3'b100;
LED_N <= 3'b010;
LED_W <= 3'b100;
	end
end 
s3:begin
	if(count == 4'd5)
	begin
	count <= 0;
	state <= s4;
	end
	else
	begin
	count = count+1;
	state = s3;
LED_S <= 3'b100;
LED_E <= 3'b001;
LED_WALK <= 3'b100;
LED_N <= 3'b001;
LED_W <= 3'b100;
	end
end 
s4:begin
	if(count == 4'd15)
	begin
	count <= 0;
	state <= s5;
	end
	else
	begin
	count <= count+1;
	state <= s4;
LED_S <= 3'b100;
LED_E <= 3'b010;
LED_WALK <= 3'b100;
LED_N <= 3'b100;
LED_W <= 3'b100;
	end
end 
s5:begin
	if(count == 4'd5)
	begin
	count <= 0;
	state <= s6;
	end
	else
	begin
	count <= count+1;
	state <= s5;
LED_S <= 3'b001;
LED_E <= 3'b001;
LED_WALK <= 3'b100;
LED_N <= 3'b100;
LED_W <= 3'b100;
	end
end 
s6:begin
	if(count == 4'd15)
	begin
	count <= 0;
	state <= s7;
	end
	else
	begin
	count <= count+1;
	state <= s6;
LED_S <= 3'b010;
LED_E <= 3'b100;
LED_WALK <= 3'b100;
LED_N <= 3'b100;
LED_W <= 3'b100;
	end
end 
s7:begin
	if(count == 4'd5)
	begin
	count <= 0;
	state <= s8;
	end
	else
	begin
	count <= count+1;
	state <= s7;
LED_S <= 3'b001;
LED_E <= 3'b100;
LED_WALK <= 3'b100;
LED_N <= 3'b100;
LED_W <= 3'b001;
	end
end 
s8:begin
	if(count == 4'd15)
	begin
	count <= 0;
	state <= s9;
	end
	else
	begin
	count <= count+1;
	state <= s8;
LED_S <= 3'b100;
LED_E <= 3'b100;
LED_WALK <= 3'b100;
LED_N <= 3'b100;
LED_W <= 3'b010;
	end
end 
s9:begin
	if(count == 4'd5)
	begin
	count <= 0;
	state <= s0;
	end
	else
	begin
	count <= count+1;
	state <= s9;
LED_S <= 3'b100;
LED_E <= 3'b100;
LED_WALK <= 3'b001;
LED_N <= 3'b100;
LED_W <= 3'b001;
	end
end 
default :begin
	LED_S = 3'b100;
LED_E = 3'b100;
LED_WALK = 3'b100;
LED_N = 3'b100;
LED_W = 3'b100;
end
endcase
end
end
endmodule
