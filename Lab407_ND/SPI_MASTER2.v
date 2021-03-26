`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:00 03/18/2021 
// Design Name: 
// Module Name:    SPI_MASTER2 
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
module SPI_MASTER2(input st,	         output wire ce_tact,
					   input clk,  	      output reg[3:0]cb_bit = 0,
						input[10:0]M_TX_DAT, output reg[15:0]cb_tact = 0,
						input clr,           output reg LOAD = 1,
						input wire MISO,     output reg SCLK = 0,
													output reg [10:0]M_RX_DAT = 0,
													output reg [10:0]sr_MTX = 0,
													output reg [10:0]sr_MRX = 0,
											      output wire MOSI);
parameter Fclk  = 50000000 ; // 50 MHz
parameter Tclk  = 20;        // 20 ns
parameter n_bit = 11;
parameter Trep  = 100000000; // 100ms
parameter Tper  = 100; 
parameter Tbit  = 2000000;   // 2ms

// reg [10:0]SRM_TX  = 0;
// reg [10:0]SRM_RX  = 0;
assign MOSI       = sr_MTX[10];
// assign SRM_RX = MISO;
wire ce           = (cb_tact == Tbit/(2*Tclk) - 1); // 50000
wire start        = st & LOAD;
assign ce_tact    = ce & SCLK;

always @ (posedge clk) begin
LOAD    <= st? 0:           ((cb_bit == n_bit - 1) & ce_tact)? 1: LOAD;
cb_tact <= (start | ce)? 0: cb_tact + 1;
cb_bit  <= start? 0:        ce_tact? cb_bit + 1:                  cb_bit;
SCLK    <= ce? !SCLK:       SCLK;
sr_MTX  <= st? M_TX_DAT:    (!LOAD & ce_tact)? sr_MTX << 1:       sr_MTX;
end
always @ (posedge SCLK) begin
sr_MRX  <= sr_MRX << 1 | MISO;
end
always @ (posedge LOAD) begin
M_RX_DAT <= sr_MRX;
end
endmodule