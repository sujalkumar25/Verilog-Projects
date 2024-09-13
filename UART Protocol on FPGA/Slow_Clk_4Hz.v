`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2024 14:38:07
// Design Name: 
// Module Name: Slow_Clk_4Hz
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


module Slow_Clk_4Hz(
    input clk_in, // input clk from ARTY-A7 of 200Mhz
    output reg clk_out // Obtained slow clk
    );

reg [24:0] count = 0; // 2^24 > 12.5 Million

always@(posedge clk_in)
begin
count<=count+1;
if(count == 12_500_000)
begin
count<=0;
clk_out=~clk_out;
end
end
endmodule
