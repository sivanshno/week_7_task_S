`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input clk,
    input btnU,
    input btnL,
    input btnR,
    input btnD,
    output [7:0] JC
);

wire reset = 0;
wire frame_begin;
wire sending_pixels;
wire sample_pixel;
wire [12:0] pixel_index;
reg [15:0] oled_data = 16'h07E0;
assign JC[2] = 0;

wire CLK6P25;
wire CLK25;
wire CLK50Hz;

clk6p25m oledClk( .Clock (clk), .signalOut(CLK6P25) );
clk25m refreshClk(  .Clock (clk), .signalOut(CLK25) );
fiftyHzGenerator movementClock ( .Clock(clk), .signalOut( CLK50Hz));

wire [6:0] x;
wire [5:0] y;

assign x = pixel_index % 96;
assign y = pixel_index / 96;

    Oled_Display(.clk(CLK6P25), .reset(0), .frame_begin(frame_begin), 
    .sending_pixels(sending_pixels), .sample_pixel(sample_pixel), .pixel_index(pixel_index),
     .pixel_data( oled_data ), .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]),
     .pmoden(JC[7])  );
     
reg [6:0] circle_x;
reg [5:0] circle_y;
wire [6:0] x_mover;
wire [5:0] y_mover;

always @ ( posedge CLK25) begin
    circle_x <= x_mover;
    circle_y <= y_mover;
end

moveCircle circleMover( .clk50hz(CLK50Hz), .clk25mhz(CLK25), .btnU( btnU), .btnD( btnD), .btnR( btnR), .btnL( btnL), .x_out(x_mover), .y_out(y_mover));
    
 wire numberFrame;
 wire number;
 wire isCircle;
 isNumberFrame determineNumberFrame( .x(x), .y(y), .signalOut( numberFrame));
 isNumber determineNumber( .x(x), .y(y), .signalOut(number));
 circle findCircle( .x(x), .y(y), .circle_x(circle_x), .circle_y(circle_y), .signalOut(isCircle));
 
    always @ (posedge CLK25) begin
        if ( isCircle ) begin
            oled_data = 16'hf800;
        end else if ( numberFrame ) begin
             oled_data = 16'hffff;
        end else if (number) begin
            oled_data = 16'h07e0;
        end else begin
            oled_data = 16'h0000;
        end
    end

endmodule