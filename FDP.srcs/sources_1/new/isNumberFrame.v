`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2025 17:08:35
// Design Name: 
// Module Name: isNumberFrame
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


module isNumberFrame(
    input [6:0] x,
    input [5:0] y,
    output signalOut
    );
    wire xIn;
    wire yIn;
    assign signalOut = (xIn | yIn);
    assign xIn = ( (( x > 4 & x < 8) | ( x > 29 & x < 33))& ( y > 30 & y < 59) );
    assign yIn = ( (( y > 30 & y < 34) | ( y > 55 & y < 59)) & (x > 4 & x < 33));
    
endmodule
