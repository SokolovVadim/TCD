`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:27 03/04/2021 
// Design Name: 
// Module Name:    VF2D 
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
module VF2D(input L, output reg Q=0,
		input Da, //���� ��� ����������� �������� �� ������ L
		input D, // ���� ��� ���������� �������� �� ������ clk
		input clk);
always @ (posedge L or posedge clk) begin
Q <= L? Da : D ;
end
endmodule
