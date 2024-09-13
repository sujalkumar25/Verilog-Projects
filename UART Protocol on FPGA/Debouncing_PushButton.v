`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2024 14:35:13
// Design Name: 
// Module Name: Debouncing_PushButton
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


module Debouncing_PushButton(
input pushbutton,
input clk_in,
output led );

wire clk_out;
wire Q1,Q1bar,Q2,Q2bar;

Slow_Clk_4Hz I1(clk_in,clk_out);
D_FF D1(clk_out,pushbutton,Q1,Q1bar);
D_FF D2(clk_out,Q1,Q2,Q2bar);

assign led= Q1&Q2bar;
endmodule
