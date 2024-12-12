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

          Date                      By                          Change Notes
------------------------  ---------------------- ------------------------------------------
   8th December 2024           Krishna Negi                      Base Code



*/
//////////////////////////////////////////////////////////////////////////////////


module EX(
    input [4:0] AluSignal,
    input [31:0] op1,
    input [31:0] op2,
    input IsImmediate,
    input IsUBranch,
    input IsBeq,
    input IsRet,
    input IsBgt,
    input [31:0] Immd,
    input [31:0] Branch_Target,
    output [31:0] Branch_PC,
    output IsBranchTaken,
    output [31:0] Alu_Result1
);

    wire [31:0] op1, op2, Immd,Branch_Target;
    wire [4:0] AluSignal;
    wire IsRet, IsBeq, IsBgt, IsUBranch, IsImmediate;
    reg IsBranchTaken;
    reg y1, y2;
    reg [31:0] Alu_Result1, Branch_PC;

    always @(*)
    begin    
        if (IsBgt == 1 && PL.Flags[1] == 1)
        begin
            y2 = 1;
        end
        else
        begin
            y2 = 0;
        end
        
        if (IsBeq == 1 && PL.Flags[0] == 1)
        begin
            y1 = 1;
        end
        else
        begin
            y1 = 0;
        end
        
        if (IsRet == 1)
        begin
            Branch_PC = op1;
        end
        else
        begin
            Branch_PC = Branch_Target;
        end
        
        if (IsUBranch == 1 || y1 == 1 || y2 == 1)
        begin
            IsBranchTaken = 1;
        end
        else
        begin
            IsBranchTaken = 0;
        end

        PL.A = op1;
        if (IsImmediate == 0)
        begin
            PL.B = op2;
        end        
        else if (IsImmediate == 1)
        begin
            PL.B = Immd;
        end

        Alu_Result1 = PL.ALU.Alu_Result;
    end

endmodule

