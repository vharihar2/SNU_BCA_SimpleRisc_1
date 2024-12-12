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


module EX_MA (
    input Clk
);

    reg [31:0] Instruction, PC_Current, Branch_Target, op2, Alu_Result1;
    reg [4:0] AluSignal;
    reg IsSt, IsLd, IsBeq, IsBgt, IsRet, IsImmediate, IsWb, IsUBranch, IsCall;
    wire Clk;

    always @(negedge Clk)
    begin
        #9.99
        Instruction <= PL.R2.Instruction;
        Branch_Target <= PL.R2.Branch_Target;
        PC_Current <= PL.R2.PC_Current;
        op2 <= PL.R2.op2;
        IsRet <= PL.R2.IsRet;
        IsBeq <= PL.R2.IsBeq;   
        IsLd <= PL.R2.IsLd;             
        IsSt <= PL.R2.IsSt;
        IsBgt <= PL.R2.IsBgt;
        IsUBranch <= PL.R2.IsUBranch;
        IsImmediate <= PL.R2.IsImmediate;
        AluSignal <= PL.R2.AluSignal;        
        IsWb <= PL.R2.IsWb;
        IsCall <= PL.R2.IsCall;
        Alu_Result1 <= PL.Alu_Result1;
    end

endmodule
