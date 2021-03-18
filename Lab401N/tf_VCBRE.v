`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:36:39 02/11/2021
// Design Name:   VCB4RE
// Module Name:   D:/frtk/Shashin/Lab401N/tf_VCBRE.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCB4RE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCBRE;

	// Inputs
	reg ce;
	reg clk;
	reg R;

	// Outputs
	wire [3:0] Q;
	wire TC;
	wire CEO;

	// Instantiate the Unit Under Test (UUT)
	VCB4RE uut (
		.ce(ce), 
		.Q(Q), 
		.clk(clk), 
		.TC(TC), 
		.R(R), 
		.CEO(CEO)
	);

	parameter Tclk=20; //Период сигнала синхронизации 20 нс
	always begin clk=1; #(Tclk/2); clk=0; #(Tclk/2); end

	initial begin
		// Initialize Inputs
		ce = 0;
		R = 0;

		// Wait 100 ns for global reset to finish
		#100; ce = 1;
		#100; R = 1; #20; R = 0;
		#100; ce = 0; R = 1; #20; R = 0;
		#60; ce = 1;

		
		// Add stimulus here

	end
      
endmodule

