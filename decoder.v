`timescale 1ns / 1ps



module decoder(

    input [4:0]number,
    output reg[6:0] out //this is connected to the 7-seg display.

    
    );
    

    always @(*)
        begin 
            case(number)   //this corresponds to the segment selection, if the bit is 1 that means that the segment is off
                         // so a binary of "1111111" means that no segment will be on segments are ABCDEFG.
                         // look at https://www.fpga4student.com/2017/09/seven-segment-led-display-controller-basys3-fpga.html for segment info
                         
                 5'b00000: out = 7'b0000001; // "0"  
                 5'b00001: out = 7'b1001111; // "1" 
                 5'b00010: out = 7'b0010010; // "2" 
                 5'b00011: out = 7'b0000110; // "3"                    
                 5'b00100: out = 7'b1001100; // "4" 
                 5'b00101: out = 7'b0100100; // "5" 
                 5'b00110: out = 7'b0100000; // "6" 
                 5'b00111: out = 7'b0001111; // "7" 
                 5'b01000: out = 7'b0000000; // "8"  
                 5'b01001: out = 7'b0000100; // "9" 
                 5'b01010: out = 7'b0001000; // "A" ABCEFG(segments A,B,C,E,F,G are ON )  
                 5'b01011: out = 7'b1100000; // "b" CEFG
                 5'b01100: out = 7'b0110001; // "C" ADEF 
                 5'b01101: out = 7'b1000010; // "d" BCDEG  
                 5'b01110: out = 7'b0110000; // "E" AFGE
                 5'b01111: out = 7'b0111000; // "F" AEFG
                 
                 5'b11110: out = 7'b0011100; //30 = degree symbol
                 5'b11111: out = 7'b1110001;  //"L" 31   we have 15 more inputs with 5 bits
                 
                 default: out = 7'b1111111; // ALL SEGMENTS OFF
             endcase
         end
         
endmodule
