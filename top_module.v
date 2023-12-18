`timescale 1ns / 1ps




module combined_system(
    input test,
    input reset,
    inout TMP_SDA,
    input [3:0] a,
    input [3:0] b,
    input [3:0] mode, 
    input c_in,
    input clock,
    output TMP_SCL,
    output c_out,
    output [6:0] out, //CATHODE
    output [7:0] anode,
    output [7:0] LED
    );
    
    //wire [15:0] w_mbar;
    
    reg[4:0] input1;
    reg[4:0] input2;
    reg[4:0] input3;
    reg[4:0] input4;
    
    wire[7:0] w_data;
    wire [3:0] w_alu;
    
    //temp sensor
     wire sda_dir;                   // direction of SDA signal - to or from master
     wire w_200kHz;                  // 200kHz SCL
                 // 8 bits of temperature data

     i2c_master master(
        .clk_200kHz(w_200kHz),
        .reset(reset),
        .temp_data(w_data),
        .SDA(TMP_SDA),
        .SDA_dir(sda_dir),
        .SCL(TMP_SCL)
    );
   

    
    always @(*) begin
    if (test == 1'b0) begin
        // Choose mode, a, and w_alu when test is 0
        input4 = mode;
        input3 = b;
        input2 = a;
        input1 = w_alu;
    end else begin
        // Choose tens and ones when test is 1
        input4 = (w_data/10);
        input3 = (w_data%10);
        input2 = 5'b11110; // degree sign
        input1 = 12; // 12 in binary
    end
end
    

    
    
    //assign an_control = 8'b11111110;
    
    wire fsm_clock;
    
    faster_clock_divider faster_clock_divider (
        .in_clk(clock),
        .out_clk(fsm_clock)
    );
    
    
    
    //clock -> fast divider -> fsm -> cathode anode out -> decoder -> cathode anode out
    fsm fsm_instance (
        .clock(fsm_clock),
        .input1(input1),
        .input2(input2),
        .input3(input3),
        .input4(input4),
        .out(out),
        .anode(anode)
    );
    
    
    ALU alu_1(a,b,mode,c_in,c_out,w_alu);
    //decoder decoder_1(w_alu,mode,control,out,anode);
    
    
    
     // Instantiate 200kHz clock generator
    clkgen_200kHz cgen(
        .clock(clock),
        .clk_200kHz(w_200kHz)
    );
       
    assign LED[7:0] = w_data[7:0];
    
endmodule
