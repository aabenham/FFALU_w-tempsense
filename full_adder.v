`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 04:51:33 PM
// Design Name: 
// Module Name: full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder(
    input c_in,
    input a,
    input b,
    output sum,
    output c_out
    );
    
    //implement full adder here.
    wire w1;
    wire w2;
    wire w3;
    
    half_adder ha0(a, b, w1, w2);
    half_adder ha1(c_in, w1, sum, w3);
    or or1(c_out,w3,w2);
    
endmodule
