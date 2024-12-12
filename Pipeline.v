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
   8th December 2024           Purnima Pant                      Base Code
                                    and 
                               Krishna Negi


*/
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

`include "IF.v"
`include "IF_OF.v"
`include "OF.v"
`include "OF_EX.v"
`include "EX.v"
`include "EX_MA.v"
`include "MA.v"
`include "MA_WB.v"
`include "WB.v"
`include "Control.v"
`include "Register_File.v"
`include "Memory.v"
`include "ALU.v"


module Pipeline (
    input Clk
);

    integer x1, x2, x3;
    wire Clk;
    wire [31:0] Instruction, Immd, op1, op2, Branch_Target;
    wire [31:0] Alu_Result, Alu_Result1, Ld_Result, d_m1, d_m2, d1, d2;
    wire IsLd, IsSt, IsBeq, IsBgt, IsRet, IsImmediate, IsWb, IsUBranch, IsCall, I, IsBranchTaken;
    wire [31:0] Branch_PC, PC_Current;
    wire [4:0] AluSignal, Opcode;
    wire [3:0] Rd;
    wire [1:0] Flags;
    reg [31:0] A, B, a_m1, a_m2, d_m3, d3, PC;
    reg [3:0] a1, a2, a3;
    reg rw, Reset;
    

    IF IF(
        .Clk(Clk),
        .Instruction(Instruction),
        .IsBranchTaken(IsBranchTaken),
        .PC_Current(PC_Current),
        .Branch_PC(Branch_PC)
    );

    IF_OF R1(
        .Clk(Clk)
    );

    OF OF(
        .Instruction(R1.Instruction),
        .Branch_Target(Branch_Target),
        .PC_Current(R1.PC_Current),
        .I(I),
        .op1(op1),
        .op2(op2),
        .Immd(Immd),
        .Opcode(Opcode),
        .IsRet(IsRet),
        .IsSt(IsSt),
        .Rd(Rd)
    );

    OF_EX R2(
        .Clk(Clk)
    );

    EX EX(
        .Branch_Target(R2.Branch_Target),
        .Branch_PC(Branch_PC),
        .Immd(R2.Immd),
        .Alu_Result1(Alu_Result1),
        .op1(R2.op1),
        .op2(R2.op2),
        .AluSignal(R2.AluSignal),
        .IsRet(R2.IsRet),
        .IsBeq(R2.IsBeq),
        .IsBgt(R2.IsBgt),
        .IsUBranch(R2.IsUBranch),
        .IsImmediate(R2.IsImmediate),
        .IsBranchTaken(IsBranchTaken)
    );

    EX_MA R3(
        .Clk(Clk)
    );

    MA MA(
        .Alu_Result1(R3.Alu_Result1),
        .op2(R3.op2),
        .IsLd(R3.IsLd),
        .IsSt(R3.IsSt),
        .Ld_Result(Ld_Result)
    );

    MA_WB R4(
        .Clk(Clk)
    );

    WB WB(
        .PC_Current(R4.PC_Current),
        .Alu_Result1(R4.Alu_Result1),
        .IsWb(R4.IsWb),
        .IsCall(R4.IsCall),
        .IsLd(R4.IsLd),
        .Rd(R4.Rd),
        .Ld_Result(R4.Ld_Result)
        
    );

    Control C(
        .Opcode(Opcode),
        .I(I),
        .IsSt(IsSt),
        .IsLd(IsLd),
        .IsBeq(IsBeq),
        .IsBgt(IsBgt),
        .IsRet(IsRet),
        .IsImmediate(IsImmediate),
        .IsWb(IsWb),
        .IsUBranch(IsUBranch),
        .IsCall(IsCall),
        .AluSignal(AluSignal)
    );

    Register_File RF(
        .Clk(Clk),
        .d1(d1),
        .d2(d2),
        .a1(a1),
        .a2(a2),
        .a3(a3),
        .d3(d3),
        .Reset(Reset),
        .IsWb(IsWb)
    );

    Memory M(
        .a_m1(a_m1),
        .a_m2(a_m2),
        .d_m1(d_m1),
        .d_m2(d_m2),
        .d_m3(d_m3),
        .rw(rw)
    );

    ALU ALU(
        .A(A),
        .B(B),
        .Alu_Result(Alu_Result),
        .AluSignal(AluSignal),
        .Flags(Flags)
    );

endmodule
