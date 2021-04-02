`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:20:17 02/22/2016 
// Design Name: 
// Module Name:    SPI_SLAVE 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
`define n 16 
module SPI_SLAVE  (input load,		output wire MISO,
    					input sclk,			output reg[`n-1:0]sr_STX=0,
						input MOSI,			output reg[`n-1:0]sr_SRX=0,
						input clr,			output reg[`n-1:0]DO=0,
						input [`n-1:0]DI);
						
wire clk1 ;
wire clk2 ; 				  
BUFG DD1 (.I(sclk),	.O(clk1));
BUFG DD2 (.I(load),	.O(clk2));
assign MISO = sr_STX[`n-1] ;
always @ (posedge sclk) begin
sr_SRX <= sr_SRX<<1 | MOSI ;
end

always @ (posedge clk2 or posedge clr) begin
DO <= clr? 0 : sr_SRX ;
end

always @ (posedge load or negedge clk1) begin
sr_STX <= load? DI : sr_STX<<1 ;
end
endmodule

