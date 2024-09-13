`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2024 00:15:24
// Design Name: 
// Module Name: UART_Protocol_Top_Module
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


module UART_Protocol_Top_Module(
//    input [7:0] data,
    input [3:0] data, // for arty-a7
    input clk,
    input rst_button,
    input transmitt_button,
    output TxD,
    output TxD_Debug,
    output Transmit_Debug,
    output Reset_Debug,
    output Clk_Debug
    );
    wire reset_from_Db;
    wire transmitt_from_Db;
    Debouncing_PushButton D1(.pushbutton(rst_button),.clk_in(clk),.led(reset_from_Db));
    Debouncing_PushButton D2(.pushbutton(transmitt_button),.clk_in(clk),.led(transmitt_from_Db));
    UART_Transmitter T1(.clk(clk),.data(data),.transmitt(transmitt_from_Db),.reset(reset_from_Db),.TxD(TxD));
    
    assign TxD_Debug = TxD;
    assign Transmit_Debug = transmitt_from_Db;
    assign Reset_Debug = reset_from_Db;
    assign Clk_Debug = clk;
endmodule
