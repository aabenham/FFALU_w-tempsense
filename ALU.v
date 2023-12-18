`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 04:53:09 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] a,
    input [3:0] b,
    input [3:0] mode, 
    input c_in,
    output reg c_out,
    output reg [3:0] result
    );
    
    //implement ALU here.
    
    wire [3:0] sum;
    wire [3:0] a;
    wire [3:0] b;
    wire ac_out; 
    
    carry_select_adder csa (a, b, 2'b00, c_in, sum, ac_out);
    
    always @(*)
        begin
            case(mode)
                0: result = a & b;
                4'b0001: result = a | b;
                
                4'b0010: result = ~(a & b);
                
                4'b0011: result = ~(a | b);  //nor
                
                4'b0100: result = a ^ b;  //works
                
                4'b0101: result = ~(a ^ b);  //
                
                4'b0110: result = ~a;
                4'b0111: result = ~b;
                4'b1000: result = !a;
                4'b1001: result = !b;
                4'b1010: begin result = sum; c_out = ac_out; end                
                4'b1011: {c_out, result} = a - b;     
                4'b1100: {c_out, result} = a * b;
                4'b1101: {c_out, result} = b - a;     
                4'b1110: {c_out, result} = a + 1;              
                4'b1111: {c_out, result} = a - 1;               
             endcase
         end
  
endmodule
