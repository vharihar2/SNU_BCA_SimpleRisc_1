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


module IF(
    input Clk,
    input [31:0] Branch_PC,
    input IsBranchTaken,
    output [31:0] Instruction,
    output [31:0] PC_Current
);

    integer x = 0;
    reg [31:0] Instruction;
    reg [31:0] PC_Current, PC_Temp, PC;
    wire [31:0] Branch_PC;
    wire Clk;
    wire IsBranchTaken;

    initial
    begin
        PC = 32'd0;
    end

    always @(negedge Clk)
    begin
        if (x == 0)
        begin
            PC_Temp = PC;
            PC_Current = PC;
        end

        for (x = 0; x < 4; x = x + 1)
        begin
            Instruction[8 * x +: 8] = PL.M.Memory[PC_Temp];
            PC_Temp = PC_Temp + 1;
        end

        if (IsBranchTaken == 1)
        begin
            PC_Current = Branch_PC;
        end
        else
        begin
            PC_Current = PC_Temp - 4;
        end
    end

    always @(IsBranchTaken)
    begin
        if (IsBranchTaken == 1)
        begin
            PC_Temp = Branch_PC;
        end
    end

endmodule
