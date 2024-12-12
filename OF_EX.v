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
   8th December 2024           Purnima Pant                      Base Code
                                   and
                               Krishna Negi

*/
//////////////////////////////////////////////////////////////////////////////////


module OF_EX (
    input Clk
);

    reg IsSt, IsLd, IsBeq, IsBgt, IsRet, IsImmediate, IsWb, IsUBranch, IsCall;
    reg [4:0] AluSignal;
    reg [31:0] Instruction, PC_Current, Branch_Target, op2, op1, Immd;
    wire Clk;

    always @(negedge Clk)
    begin
        #9.99
        Instruction <= PL.R1.Instruction;
        IsBeq = PL.IsBeq;
        IsRet = PL.IsRet;
        IsBgt = PL.IsBgt;
        IsImmediate = PL.IsImmediate;
        IsLd = PL.IsLd;
        IsWb = PL.IsWb;
        IsUBranch = PL.IsUBranch;
        AluSignal = PL.AluSignal;
        IsCall = PL.IsCall;
        PC_Current <= PL.R1.PC_Current;
        IsSt = PL.IsSt;
        op1 = PL.op1;
        op2 = PL.op2;
        Branch_Target  = PL.Branch_Target;
        Immd = PL.Immd;
    end

endmodule
