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


module MA_WB (
    input Clk
);

    wire Clk;
    reg [31:0] Instruction, PC_Current;
    reg [31:0] Branch_Target;
    reg [31:0] Alu_Result1, Ld_Result;
    reg [4:0] AluSignal;
    reg [3:0] Rd;
    reg IsSt, IsLd, IsBeq, IsBgt, IsRet, IsImmediate, IsWb, IsUBranch, IsCall;

    always @(negedge Clk)
    begin
        #9.99;
        Instruction <= PL.R3.Instruction;
        Alu_Result1 <= PL.R3.Alu_Result1;
        Branch_Target <= PL.R3.Branch_Target;
        PC_Current <= PL.R3.PC_Current;
        IsBgt <= PL.R3.IsBgt;
        IsImmediate <= PL.R3.IsImmediate;
        IsCall <= PL.R3.IsCall;                
        IsSt <= PL.R3.IsSt;
        IsUBranch <= PL.R3.IsUBranch;        
        IsLd <= PL.R3.IsLd;
        IsRet <= PL.R3.IsRet;        
        IsBeq <= PL.R3.IsBeq;
        AluSignal <= PL.R3.AluSignal;
        IsWb <= PL.R3.IsWb;
        Ld_Result = PL.Ld_Result;
        Rd <= PL.R3.Instruction[25:22];
    end

endmodule
