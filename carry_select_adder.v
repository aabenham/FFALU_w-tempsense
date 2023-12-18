`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 04:52:27 PM
// Design Name: 
// Module Name: carry_select_adder
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


module carry_select_adder(
        input [3:0] a,
        input [3:0] b,
        input [1:0] mode,
        input c_in,
        output reg [3:0] sum,
        output reg c_out

    );
    
    wire [3:0]bi;
    wire cia;
    
    assign bi = (mode == 2'b01) ? ~b + 1 : b;
    assign cia = (mode == 2'b01) ? 1'b1 : c_in;
    
    //implement ripple carry adder here.
    
    wire w1;
    wire ci_out;
    wire w3;
    wire w4;
    wire c0_out;
    wire c1_out;
    wire [1:0] sum0;
    wire [1:0] sum1;
    wire [1:0] suma;
    
    full_adder fa0(c_in, a[0], bi[0], suma[0], w1);
    full_adder fa1(w1, a[1], bi[1], suma[1], ci_out);
    
    full_adder fa2(1'b0, a[2], bi[2], sum0[0], w3);
    full_adder fa3(w3, a[3], bi[3], sum0[1], c0_out);
    
    full_adder fa4(1'b1, a[2], bi[2], sum1[0], w4);
    full_adder fa5(w4, a[3], bi[3], sum1[1], c1_out);
    
    //multiplexor
    //wire [1:0]sumtemp = sum[3:2];
    always @(*)
        if (ci_out)begin
            sum[3:2] = sum1;
            sum[1:0] = suma;
            c_out = c1_out;
        end else begin
            sum[3:2] = sum0;
            c_out = c0_out;
            sum[1:0] = suma;
        end
        
    
    
endmodule
