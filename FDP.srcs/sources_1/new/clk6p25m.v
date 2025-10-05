`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2025 15:19:56
// Design Name: 
// Module Name: clk6p25m
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

    module clk6p25m(
        input Clock,
        output reg signalOut
        );
            reg [2:0]count;
        
        initial begin
            count  = {3{1'b0}};
            signalOut = 1'b0;
        end
        
        always @ ( posedge Clock) begin
            signalOut <= (count == 0? ~signalOut : signalOut);
        end
    endmodule

