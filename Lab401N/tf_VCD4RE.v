`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:04:25 02/11/2021
// Design Name:   VCD4RE
// Module Name:   D:/frtk/Shashin/Lab401N/tf_VCD4RE.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCD4RE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCD4RE;

	// Inputs
	reg clk;
	reg ce;
	reg R;

	// Outputs
	wire TC;
	wire CEO;
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	VCD4RE uut (
		.clk(clk), 
		.TC(TC), 
		.ce(ce), 
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

