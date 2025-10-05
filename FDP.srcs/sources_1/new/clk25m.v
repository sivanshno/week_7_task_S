`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2025 16:14:05
// Design Name: 
// Module Name: clk25m
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


    module clk25m(
        input Clock,
        output reg signalOut
        );
            reg [3:0]count;
        
        initial begin
            count  = {4{1'b0}};
            signalOut = 1'b0;
        end
        
        always @ ( posedge Clock) begin
            count <= (count == 4'd8) ? 0 : count + 1;
            signalOut <= (count == 0? ~signalOut : signalOut);
        end
    endmodule
