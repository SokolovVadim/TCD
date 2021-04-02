`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:12:47 02/22/2016
// Design Name:   Sch_test_SLAVE
// Module Name:   D:/Proj2016/MIPT/LABs/FPGA_ISE14/Lab407DN/tf_Sch_test_SLAVE.v
// Project Name:  Lab407DN
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sch_test_SLAVE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_Sch_test_SLAVE;

	// Inputs
	reg st;
	reg clk;
	reg [15:0] MTX_DAT;
	reg RESET;
	reg [15:0] STX_DAT;

	// Outputs
	wire LOAD;
	wire SCLK;
	wire MOSI;
	wire [15:0] MRX_DAT;
	wire [15:0] sr_MTX;
	wire [15:0] sr_MRX;
	wire [7:0] cb_bit;
	wire ce_tact;
	wire MISO;
	wire [15:0] sr_STX;
	wire [15:0] sr_SRX;
	wire [15:0] SRX_DAT;

	// Instantiate the Unit Under Test (UUT)
	Sch_test_SLAVE uut (
		.st(st), 
		.LOAD(LOAD), 
		.clk(clk), 
		.SCLK(SCLK), 
		.MTX_DAT(MTX_DAT), 
		.MOSI(MOSI), 
		.RESET(RESET), 
		.MRX_DAT(MRX_DAT), 
		.sr_MTX(sr_MTX), 
		.sr_MRX(sr_MRX), 
		.cb_bit(cb_bit), 
		.ce_tact(ce_tact), 
		.STX_DAT(STX_DAT), 
		.MISO(MISO), 
		.sr_STX(sr_STX), 
		.sr_SRX(sr_SRX), 
		.SRX_DAT(SRX_DAT)
	);
always begin clk=0; #10; clk=1; #10; end
	initial begin
		st = 0;	RESET = 0;	MTX_DAT = 0;			STX_DAT = 0;
#100;	st = 1;	RESET = 0;	MTX_DAT = 16'h1234;	STX_DAT = 16'h5678;
#20;	st = 0;	RESET = 0;	MTX_DAT = 16'h1234;	STX_DAT = 16'h5678;        
	end
      
endmodule

