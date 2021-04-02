`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:30 08/07/2018 
// Design Name: 
// Module Name:    SRI_SLAVE_RX 
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

`define n 64 //???
module SRI_SLAVE_RX (
			input load,	output reg[`n-1:0]sr_SRX=0,//������� ������
    		input sclk,	output reg[`n-1:0]DO=0,	//����� �������� ������
			input MOSI );		
//--�������������� ����� ������				
always @ (posedge sclk) begin
sr_SRX <= sr_SRX<<1 | MOSI ;
end
//--�������� �������� ������ �� �������� ������ � �����
always @ (posedge load) begin
DO <= sr_SRX ;
end

endmodule

