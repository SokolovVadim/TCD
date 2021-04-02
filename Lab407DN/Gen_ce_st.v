`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:02 02/16/2014 
// Design Name: 
// Module Name:    Gen_ce_st 
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
module Gen_ce_st(input clk,	output ce_tact,
										output ce_st );
    
   
parameter Tclk=20 ;// 20ns    
parameter Tbit = 2000000 ; //2ms
parameter Ttact = Tbit/2 ; //1ms 
parameter Tst = 100000000 ;// 100ms
reg [15:0]cb_tact =0 ;//—четчик такта
reg [15:0]cb_st =0 ;//—четчик периода запуска
assign ce_tact = (cb_tact==Ttact/Tclk) ;
assign ce_st = ce_tact & (cb_st==Tst/Ttact) ;

always @ (posedge clk) begin
cb_tact <= (ce_tact)? 1 : cb_tact+1 ; 
cb_st <= (ce_st)? 1 : (ce_tact)? cb_st+1 : cb_st ;
end 
endmodule
