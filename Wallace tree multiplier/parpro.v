`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2024 11:20:27
// Design Name: 
// Module Name: parpro
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


module lastadder (a,b,result);
input [9:0]a;
input [10:0]b;
output [10:0]result;


assign result = a+b;

    
    
endmodule
