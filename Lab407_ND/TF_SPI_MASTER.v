`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:07 03/11/2021
// Design Name:   SPI_MASTER
// Module Name:   D:/frtk/713/Sokolov/Lab407_ND/TF_SPI_MASTER.v
// Project Name:  Lab407_ND
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SPI_MASTER
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TF_SPI_MASTER2;

	// Inputs
	reg st;
	reg clk;
	reg [10:0]M_TX_DAT;

	// Outputs
	wire ce_tact;
	wire [3:0] cb_bit;
	wire [15:0] cb_tact;
	wire LOAD;
	wire SCLK;
	wire MOSI;

	// Instantiate the Unit Under Test (UUT)
	SPI_MASTER2 uut (
		.st(st), 
		.ce_tact(ce_tact), 
		.clk(clk), 
		.cb_bit(cb_bit), 
		.cb_tact(cb_tact), 
		.LOAD(LOAD), 
		.SCLK(SCLK),
		.M_TX_DAT(M_TX_DAT),
		.MOSI(MOSI)
	);
	always begin clk = 0; #10; clk = 1; #10; end
	initial begin
		// Initialize Inputs
		st = 0;
		M_TX_DAT = 0;
	
		// Wait 100 ns for global reset to finish
		#100; st = 1; M_TX_DAT = 11'h2CC;
		#20; st = 0;
      #1000; // MISO = 1;
		// Add stimulus here

	end
      
endmodule

