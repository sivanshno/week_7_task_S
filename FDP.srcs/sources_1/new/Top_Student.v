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
wire[15:0] oled_data;
assign JC[2] = 0;

wire CLK6P25;
wire CLK25;

clk6p25m oledClk( .Clock (clk), .signalOut(CLK6P25) );
clk25m refreshClk(  .Clock (clk), .signalOut(CLK25) );

wire [6:0] x;
wire [5:0] y;

assign x = pixel_index % 96;
assign y = pixel_index / 96;

    Oled_Display(.clk(CLK6P25), .reset(0), .frame_begin(frame_begin), 
    .sending_pixels(sending_pixels), .sample_pixel(sample_pixel), .pixel_index(pixel_index),
     .pixel_data( oled_data ), .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]),
     .pmoden(JC[7])  );   
     
taskS dut(
         .btnU (btnU),
         .btnR(btnR),
         .btnL(btnL),
         .btnD(btnD),
         .clk(clk),
         .x(x),
         .y(y),
         .oled_data(oled_data)
         );endmodule