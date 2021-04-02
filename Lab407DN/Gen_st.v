`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:24 02/22/2016 
// Design Name: 
// Module Name:    Gen_st 
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
module Gen_st(input clk,	output ce_st);
										 
       
parameter Tclk=20 ;// 20ns    
parameter Tst = 100000 ;// 0.1ms
reg [18:0]cb_st =0 ;//—четчик периода запуска
assign ce_st = (cb_st==Tst/Tclk) ;

always @ (posedge clk) begin
cb_st <= (ce_st)? 1 :  cb_st+1  ;
end 
endmodule
