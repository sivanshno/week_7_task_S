`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2025 13:11:23
// Design Name: 
// Module Name: gen50Hz
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


module gen50Hz(
    input Clock,
    output reg signalOut
    );
          reg [23:0]count;
         
         initial begin
             count  = {24{1'b0}};
             signalOut = 1'b0;
         end
         
         always @ ( posedge Clock) begin
             count <= (count == 24'd1_000_000) ? 0 : count + 1;
             signalOut <= (count == 0? ~signalOut : signalOut);
         end
endmodule
