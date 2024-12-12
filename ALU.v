`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
* Copyright (c) 2024, Shiv Nadar University, Delhi NCR, India. All Rights
* Reserved. Permission to use, copy, modify and distribute this software for
* educational, research, and not-for-profit purposes, without fee and without a
* signed license agreement, is hereby granted, provided that this paragraph and
* the following two paragraphs appear in all copies, modifications, and
* distributions.
*
* IN NO EVENT SHALL SHIV NADAR UNIVERSITY BE LIABLE TO ANY PARTY FOR DIRECT,
* INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST
* PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE.
*
* SHIV NADAR UNIVERSITY SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT
* NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
* PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS PROVIDED "AS IS". SHIV
* NADAR UNIVERSITY HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES,
* ENHANCEMENTS, OR MODIFICATIONS.
*
Revision History:

          Date                      By                          Change Notes
------------------------  ---------------------- ------------------------------------------
   8th December 2024           Krishna Negi                      Base Code



*/
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [4:0] AluSignal,
    output [31:0] Alu_Result,
    output [1:0] Flags
);

    wire signed [31:0] A, B;
    wire signed [31:0] A_signed;
    wire [4:0] AluSignal;
    reg [31:0] Alu_Result;
    reg [1:0] Flags;

    assign A_signed = A;

    always @(*)
    begin
        case (AluSignal)
            5'b00000: 
                Alu_Result = A + B; 
            5'b00001: 
                Alu_Result = A - B; 
            5'b00010: 
                Alu_Result = A * B;
            5'b00011:
                Alu_Result = A / B; 
            5'b00100:
                Alu_Result = A % B;
            5'b00101: 
            begin
                if (A > B)
                begin
                    Flags[1] = 1'b1;                
                    Flags[0] = 1'b0; 
                end            
                else if (A == B)
                begin 
                    Flags[1] = 1'b0;                
                    Flags[0] = 1'b1;
                end  
                else 
                begin
                    Flags[1] = 1'b0;
                    Flags[0] = 1'b0; 
                end
            end

            5'b00110: 
                Alu_Result = A & B;
            5'b00111: 
                Alu_Result = A | B;
            5'b01000: 
                Alu_Result = ~A; 
            5'b01001: 
                Alu_Result = B;
            5'b01010: 
                Alu_Result = A << B; 
            5'b01011: 
                Alu_Result = A >> B;
            5'b01100: 
            begin
                Alu_Result = A_signed >>> B; // asr (signed)
            end
            5'b01101: 
            begin

            end
            default: 
            begin
                Alu_Result = 32'd0;
                Flags[1] = 1'b0;
                Flags[0] = 1'b0; 
            end
        endcase
    end

endmodule
