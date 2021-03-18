`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:33:40 02/11/2021
// Design Name:   VCBDmSE
// Module Name:   D:/frtk/Shashin/Lab401N/tf_VCBDmSE.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCBDmSE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCBDmSE;

	// Inputs
	reg ce;
	reg clk;
	reg s;

	// Outputs
	wire [3:0] Q;
	wire TC;
	wire CEO;

	// Instantiate the Unit Under Test (UUT)
	VCBDmSE uut (
		.ce(ce), 
		.Q(Q), 
		.clk(clk), 
		.TC(TC), 
		.s(s), 
		.CEO(CEO)
	);
	
	parameter Tclk=20; //Период сигнала синхронизации 20 нс
	always begin clk=1; #(Tclk/2); clk=0; #(Tclk/2); end


	initial begin
		// Initialize Inputs
		ce = 0;
		s = 0;

		// Wait 100 ns for global reset to finish
		#50; ce = 1;
		#50; s = 1; #20; s = 0;
		#50; ce = 0; s = 1; #20; s = 0;
		#60; ce = 1;
        
		// Add stimulus here

	end
      
endmodule

