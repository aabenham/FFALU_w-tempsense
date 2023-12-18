`timescale 1ns / 1ps



module fsm(
        input clock,
        input [4:0] input1,
        input [4:0] input2,
        input [4:0] input3,
        input [4:0] input4,
        output [6:0] out,
        output reg [7:0] anode
    );
    

    reg [4:0] five_bit_number;
    // instantiate decoder that decodes the four bit number into the cathode
    decoder fsm_decoder(five_bit_number,out);
        
    reg [2:0] state; // stores state of FSM  
    initial begin
		state = 0;
		anode = 8'b11111111;
	end
    

    always @(posedge clock)
	begin
		// increment state
		state = state + 1;
		// set anode (which display do you want to set?)
		//   hint: if state == 0, then set only the LSB of anode to zero,
		//         if state == 1, then set only the second to LSB to zero.
		case (state)
            0: anode = 8'b11111110; 
            1: anode = 8'b11111101; 
            2: anode = 8'b11111011; 
            3: anode = 8'b11110111;   // add to use 4 more leds
            4: anode = 8'b11101111; 
            5: anode = 8'b11011111; 
            6: anode = 8'b10111111; 
            7: anode = 8'b01111111;
            default: anode = 8'b11111111; 
        endcase
		// set the four bit number to be the approprate slice of the 16-bit number
		
		case (state)
            0: five_bit_number = input1; //hex 1  result  C
            1: five_bit_number = input2; //   
            2: five_bit_number = input3; // 
            3: five_bit_number = input4;// 
            4: five_bit_number = 5'b00011; //3
            5: five_bit_number = 5'b01011; //b
            6: five_bit_number = 5'b01010; //A
            7: five_bit_number = 5'b11111; //L
            
            default: five_bit_number = 5'b00000; 
        endcase
	end
    
endmodule
