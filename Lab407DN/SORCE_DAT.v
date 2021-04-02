`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:59 02/16/2014 
// Design Name: 
// Module Name:    SORCE_DAT 
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
module SORCE_DAT(
    output wire [15:0] MASTER_dat,
    output wire [15:0] SLAVE_dat
    );
assign MASTER_dat=16'h1234 ;
assign SLAVE_dat =16'h5678 ;

endmodule
