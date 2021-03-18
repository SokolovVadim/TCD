`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:41:04 02/18/2021 
// Design Name: 
// Module Name:    Gen_Nms_1s 
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

`define N 11 //«аданный вариант N из таблицы 3
module Gen_Nms_1s (input clk, output wire CEO,
input ce, //ce1ms
input Tmod );
parameter F1kHz =1000 ; //„астота 1 к√ц
parameter F1Hz =1 ; //„астота 1 √ц
reg[9:0]cb_Nms = 0 ; //—четчик N миллисекунд

wire[9:0]Nms = Tmod? `N-1 : ((F1kHz/F1Hz)-1) ; //„исло дл€ делител€ частоты
assign CEO = ce & (cb_Nms==0) ; //1 секунда или Nms
always @(posedge clk) if (ce) begin
cb_Nms <= (cb_Nms==0)? Nms : cb_Nms-1 ; //—чет N миллисекунд
end
endmodule