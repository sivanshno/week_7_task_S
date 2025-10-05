`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2025 17:54:19
// Design Name: 
// Module Name: collision
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


module collision(
    input clk,
    input [6:0] x_circle,
    input [5:0] y_circle,
    output signalOut
    );
    reg [6:0] check_x;
    reg [5:0] check_y;
    reg result;
    wire numberFrame;
    wire isCircle; 
    isNumberFrame dut( .x(check_x), .y(check_y), .signalOut(numberFrame));
    circle checkCircle( .x(check_x), .y(check_y), 
    .circle_x(x_circle), .circle_y(y_circle), .signalOut(isCircle));
    initial begin
        check_x = x_circle - 8;
        check_y = y_circle - 8;
        result = 0;
    end
    
    always @(posedge clk) begin
        if ( ~( check_x > x_circle + 8) ) begin
            if ( check_y == y_circle + 8) begin
                check_y <= y_circle - 8 ;
                check_x <= check_x + 1;
            end else begin
                check_y <= check_y + 1;
            end
        end
    end
    
    always @ ( posedge check_y) begin
        if ( isCircle & numberFrame) begin
            result = 1;
        end
    end
    
    assign signalOut = result;
    
endmodule
