`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:19:34 02/11/2021
// Design Name:   VCJmRE
// Module Name:   D:/frtk/Shashin/Lab401N/tf_VCJmRE.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCJmRE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCJmRE;

	// Inputs
	reg ce;
	reg clk;
	reg R;

	// Outputs
	wire TC;
	wire CEO;
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	VCJmRE uut (
		.ce(ce), 
		.TC(TC), 
		.clk(clk), 
		.CEO(CEO), 
		.R(R), 
		.Q(Q)
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

