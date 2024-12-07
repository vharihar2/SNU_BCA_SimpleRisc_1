`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*
* Copyright (c) 2022, Shiv Nadar University, Delhi NCR, India. All Rights
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

    Date                By                          Change Notes
------------  ---------------------- ------------------------------------------
*



*/
//////////////////////////////////////////////////////////////////////////////////


module OF(
    input IsRet,
    input IsSt,
    input [31:0] Instruction,
    input [31:0] PC_Current,
    output [31:0] op1,
    output [31:0] op2,
    output [4:0] Opcode,
    output [3:0] Rd,
    output [31:0] Branch_Target,
    output I,
    output [31:0] Immd

);

    wire [31:0] Instruction, PC_Current;
    wire IsRet, IsSt;
    reg [3:0] Rd;
    reg signed [26:0] Branch_Temp;
    reg [4:0] Opcode;
    reg I;
    reg signed [15:0] Imm_Temp;
    reg [31:0] Immd, Branch_Target, op1, op2;;

    always @(*)
    begin
        I = Instruction[26];
        Branch_Temp = Instruction[26:0];
        Rd = Instruction[25:22];
        Imm_Temp = Instruction[15:0];
        Opcode = Instruction[31:27];
        
        if (I == 1)
        begin
            if (Instruction[17:16] == 2'b00)
            begin
                Immd = Imm_Temp;
            end
            else if (Instruction[17:16] == 2'b10)
            begin
                Immd = 32'd0;
                Immd = Immd + Instruction[15:0];
                Immd = Immd << 16;
            end            
            else if (Instruction[17:16] == 2'b01)
            begin
                Immd = 32'd0;
                Immd = Immd + Instruction[15:0];
            end
        end

        Branch_Temp  = Branch_Temp << 2;
        Branch_Target = Branch_Temp;
        Branch_Target = Branch_Target + PC_Current;

        if (IsSt == 1)
        begin
            PL.a2 = Instruction[25:22];
        end
        else
        begin
            PL.a2 = Instruction[17:14];
        end
        
        if (IsRet == 1)
        begin
            PL.a1 = 4'b1111;
        end
        else 
        begin
            PL.a1 = Instruction[21:18];
        end

        op1 = PL.d1;
        op2 = PL.d2;
    end

endmodule