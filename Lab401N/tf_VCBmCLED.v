`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:53:19 02/11/2021
// Design Name:   VCBmCLED
// Module Name:   D:/frtk/Shashin/Lab401N/tf_VCBmCLED.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCBmCLED
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCBmCLED;

	// Inputs
	reg ce;
	reg up;
	reg [3:0] di;
	reg L;
	reg clk;
	reg clr;

	// Outputs
	wire [3:0] Q;
	wire CEO;
	wire TC;

	// Instantiate the Unit Under Test (UUT)
	VCBmCLED uut (
		.ce(ce), 
		.Q(Q), 
		.up(up), 
		.CEO(CEO), 
		.di(di), 
		.TC(TC), 
		.L(L), 
		.clk(clk), 
		.clr(clr)
	);

	parameter Tclk=20; //Период сигнала синхронизации 20 нс
	always begin clk=1; #(Tclk/2); clk=0; #(Tclk/2); end

	initial begin
		// Initialize Inputs
		ce = 0;
		up = 1;
		di = 0;
		L = 0;
		clr = 0;

		// Wait 100 ns for global reset to finish
		#50; ce = 1;
		#50; clr = 1; 
		#20; clr = 0;
		#20; L = 1; di = 12;
		#10; L = 0;
		#50; ce = 0; clr = 1; 
		#20; clr = 0;
		#50; ce = 1; 
		#100; up = 0;		
		// Add stimulus here

	end
      
endmodule

