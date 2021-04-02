// Verilog test fixture created from schematic E:\Proj2014\MIPT\LABs\FPGA_ISE14\Lab407DN\MOSI_BL.sch - Sat Feb 15 11:31:44 2014

`timescale 1ns / 1ps

module MOSI_BL_MOSI_BL_sch_tb();

// Inputs
   reg [15:0] TX_MD;
   reg LEFT;
   reg clk;
   reg ST;
   reg MISO;

// Output
   wire EN_TX;
   wire SCLK;
   wire CEfront;
   wire LOAD;
   wire MOSI;
   wire CEspad;
   wire [15:0] RX_SD;

// Bidirs

// Instantiate the UUT
   MOSI_BL UUT (
		.TX_MD(TX_MD), 
		.LEFT(LEFT), 
		.clk(clk), 
		.EN_TX(EN_TX), 
		.SCLK(SCLK), 
		.CEfront(CEfront), 
		.LOAD(LOAD), 
		.MOSI(MOSI), 
		.ST(ST), 
		.CEspad(CEspad), 
		.MISO(MISO), 
		.RX_SD(RX_SD)
   );
parameter Tclk=20; //Tclk=20ns
always begin clk=1'b0; #(Tclk/2) clk=1'b1; #(Tclk/2); end
       initial begin
		ST = 0;	TX_MD = 0;			LEFT = 0;	MISO = 0;
#1095;	ST = 1;	TX_MD = 16'h000F;	LEFT = 0;	MISO = 0;	
#20;		ST = 0;	TX_MD = 16'h000F;	LEFT = 0;	MISO = 0;
			
#12000;	ST = 1;	TX_MD = 16'h000F;	LEFT = 1;	MISO = 0;	
#20;		ST = 0;	TX_MD = 16'h000F;	LEFT = 1;	MISO = 0;	
end
endmodule
