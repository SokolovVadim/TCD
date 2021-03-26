`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:35 03/25/2021 
// Design Name: 
// Module Name:    SCH_TEST_MASTER_SLAVE 
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
//
//////////////////////////////////////////////////////////////////////////////////
module SCH_TEST_MASTER_SLAVE(
// ------------ SPI_MASTER Output ------------
    input ST,            output wire LOAD,
    input clk,           output wire SCLK,
    input [10:0] MTX_DAT,output wire MOSI,
    input RESET,         output wire [10:0]MRX_DAT,
	                      output wire [10:0]sr_MTX,
							    output wire [10:0]sr_MRX,
							    output wire [3:0]cb_bit,
	                      output wire ce_tact,
// ------------ SPI_SLAVE Output ------------	 
	 input [10:0]STX_DAT, output wire MISO,
	                      output wire[10:0]sr_STX,
	                      output wire[10:0]sr_SRX,
	                      output wire[10:0]SRX_DAT);
	 
SPI_MASTER2 DD1(
    .st(ST),            .LOAD(LOAD),
    .clk(clk),          .SCLK(SCLK),
    .M_TX_DAT(MTX_DAT), .MOSI(MOSI),
    .clr(RESET),        .M_RX_DAT(MRX_DAT), 
    .MISO(MISO),        .sr_MTX(sr_MTX),
	                     .sr_MRX(sr_MRX),
                        .cb_bit(cb_bit), 
							   .ce_tact(ce_tact));
							
SPI_SLAVE DD2 (
	 .load(LOAD),        .MISO(MISO),
	 .sclk(SCLK),        .sr_STX(sr_STX),
	 .MOSI(MOSI),        .sr_SRX(sr_SRX),
	 .clr(RESET),        .DO(SRX_DAT),
	 .DI(STX_DAT));
                     


endmodule
