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


module MA (
    input [31:0] Alu_Result1,
    input [31:0] op2,
    input IsSt,
    input IsLd,
    output [31:0] Ld_Result
);

    reg [31:0] Ld_Result;
    wire [31:0] op2, Alu_Result1;
    wire IsLd, IsSt;

    always @(*)
    begin
        if (IsSt == 1)
        begin
            PL.rw = 1;
            PL.a_m2 = Alu_Result1;
            PL.d_m3 = op2;
        end
        
        else if (IsLd == 1)
        begin
            PL.a_m1 = Alu_Result1;
            Ld_Result = PL.d_m1;
            PL.rw = 0;
        end
    end

endmodule