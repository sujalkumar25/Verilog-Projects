`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  NIELIT Calicut Internship, 2024
// Engineer: V. Hima Vamsi
// 
// Create Date: 17.07.2024 20:41:03
// Design Name: UART_Transmitter Module
// Module Name: UART_Transmitter
// Project Name:  UART PROTOCOL EXECUSION 
// Target Devices: ARTY A7 FPGA
// Tool Versions: Viavado 2023.2
// Description: 
// 
// 
// Revision 0.01 - File Created
// Additional Comments:
// 
/////////////////////////////////////////////////////////////////////////////////



module UART_Transmitter(
    input clk,
 //   input [7:0] data,
    input [3:0] data, // for arty-a7
    input transmitt,
    input reset,
    output reg TxD
    );
    
    // Internal variables
    reg [3:0] bit_counter; // To count 10 bits
    reg [13:0] baudrate_counter; // 10,416 = clk / baudrate 
    reg [9:0] shiftright_reg; // 10bits that will be serially transmitted
    
    reg state, next_state; // idle or transmitting mode
    reg shift, load, clear; // Signals: To start shiftting the bits, loading and clearing
    
    // UART
    
    always @(posedge clk)
    begin
        if (reset)
        begin
        state <= 0; // state is idle
        bit_counter <= 0;
        baudrate_counter <= 0;
        end
        else
        begin
                baudrate_counter <= baudrate_counter + 1;
                if (baudrate_counter == 10416)
                begin
                state <= next_state; // state changes from idle to transmitting
                baudrate_counter <= 0; //resets to zero
                
                if (load)
                begin
                  shiftright_reg <= {1'b1, 1'b0, 1'b1, 1'b1, 1'b0, data[3],data[2],data[1],data[0], 1'b0};  // this helps to get ascii characters of 4x notations. where x will rane from 0000 - 1111 i.e. 0 to F i.e. 40 to 4F
//                shiftright_reg <= {1'b1, data, 1'b0}; // stop, data, start and now the data is loaded into the reg
                end
                
                if (clear)
                begin
                bit_counter <= 0;  
                end
                
                if (shift)
                begin
                shiftright_reg <= shiftright_reg >> 1;
                bit_counter <= bit_counter + 1;
                end
                end
                end
                end
    
        // Mealy state machine
    
        always @(posedge clk)
        begin
        load <= 0;
        shift <= 0;
        clear <= 0;
        TxD <= 1; // There is no transmission, it happens when TxD = 0
    
        case (state) // Idle state
            0:  begin
                if (transmitt) // transmitt button is pressed
                begin
                next_state <= 1; 
                load <= 1;
                shift <= 0; // no shift at this point
                clear <= 0;
                end
                else 
                begin
                next_state <= 0;
                TxD <= 1;
                end
                end
            
            1:  begin // transmitting state 
                if (bit_counter == 10)
                begin
                next_state <= 0; // it should change from transmitt mode to idle mode
                clear <= 1; // clear all counters
                end
                else 
                begin
                next_state <= 1; // stay in transmitt state
                TxD <= shiftright_reg[0];
                shift <= 1; // continues shifting the data and new bit arrives at lsb of shiftreg
                end
                end
            
            default: next_state <= 0;
            endcase
            end
endmodule