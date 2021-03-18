`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:12 02/11/2021
// Design Name:   VCGrey4Re
// Module Name:   D:/frtk/Shashin/Lab401N/tf_VCGrey4Re.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCGrey4Re
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCGrey4Re;

	// Inputs
	reg clk;
	reg ce;
	reg r;

	// Outputs
	wire [3:0] Y;
	wire CEO;
	wire TC;

	// Instantiate the Unit Under Test (UUT)
	VCGrey4Re uut (
		.clk(clk), 
		.Y(Y), 
		.ce(ce), 
		.CEO(CEO), 
		.r(r), 
		.TC(TC)
	);

	parameter Tclk=20; //Период сигнала синхронизации 20 нс
	always begin clk=1; #(Tclk/2); clk=0; #(Tclk/2); end


	initial begin
		// Initialize Inputs
		clk = 0;
		ce = 0;
		r = 0;

		// Wait 100 ns for global reset to finish
		#100; ce = 1;
		#100; r = 1; #20;r  = 0;
		#100; ce = 0; r = 1; #20; r = 0;
		#60; ce = 1;

		// Add stimulus here

	end
      
endmodule

