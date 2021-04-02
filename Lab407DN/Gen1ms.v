`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:30 02/16/2014 
// Design Name: 
// Module Name:    Gen1ms 
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
module Gen1ms(input clk, output wire ce1ms );
   
parameter Fclk  =50000000 ;	//„астота генератора синхронизации 50 ћ√ц
parameter F1kHz =1000 ;	//„астота 1 к√ц

reg[16:0]ct_ms = 0  ;	//—четчик миллисекунд
assign ce1ms = (ct_ms==0) ;//1 милисекунда
//ƒелитель частоты
always @(posedge clk) begin
ct_ms <= ce1ms? ((Fclk/F1kHz)-1) : ct_ms-1 ;//—чет миллисекунд
end
endmodule
