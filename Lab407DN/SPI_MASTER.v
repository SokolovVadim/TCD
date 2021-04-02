`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:28 02/22/2016 
// Design Name: 
// Module Name:    SPI_MASTER 
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
`define m 16  
`define Fclk	 50000000 	//50Mhz
`define SPI_VEL  1000000 	// 6250000
`define Nt 	`Fclk/(2*`SPI_VEL) 	// Nt=8
module SPI_MASTER(input st,					output reg LOAD=1,
    					input clk,					output reg SCLK=0,
						input MISO,					output wire MOSI,													
						input[`m-1:0]DI,			output reg [`m-1:0]DO=0,
						input clr,					output reg [`m-1:0]sr_MTX=0,
														output reg [`m-1:0]sr_MRX=0,
														output reg [7:0]cb_bit=0,
														output wire ce,
														output wire ce_tact);																																																		
reg [8:0]cb_tact=0 ; 										   			
assign ce = (cb_tact==`Nt-1) ;
assign MOSI=sr_MTX[`m-1] ; 
assign ce_tact = ce & SCLK ;
wire start = st & LOAD ;

always @ (posedge clk) begin
LOAD <= st? 0 : ((cb_bit==`m-1) & ce_tact)? 1 :  LOAD ;
cb_tact <= (start | ce)? 0 : cb_tact+1 ;
SCLK   <= LOAD? 0 : ce? !SCLK : SCLK;
sr_MTX <= start? DI : ce_tact? sr_MTX<<1 : sr_MTX ; 
cb_bit <= start? 0 : ce_tact? cb_bit+1 : cb_bit ;
end

always @ (posedge SCLK ) begin //clk1
sr_MRX <= sr_MRX<<1 | MISO ;
end

always @ (posedge LOAD or posedge clr) begin //clk2
DO <= clr? 0 : sr_MRX ;
end
endmodule
