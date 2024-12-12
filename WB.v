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



*/
//////////////////////////////////////////////////////////////////////////////////


module WB (
    input IsLd,
    input IsCall,    
    input IsWb,
    input [31:0] Ld_Result,
    input [31:0] PC_Current,
    input [3:0] Rd,
    input [31:0] Alu_Result1
);       

    wire [31:0] Ld_Result, PC_Current;
    wire [31:0] Alu_Result1;
    wire IsWb, IsCall, IsLd;
    wire [3:0] Rd;

    always @(*)
    begin
        if (IsWb == 1)
        begin  
            if (IsCall == 0)
            begin
                PL.a3 = Rd;
            end        
            else if (IsCall == 1)
            begin
                PL.a3 = 4'b1111;
            end
            
            if (IsLd == 0 && IsCall == 0)
            begin
                PL.d3 = Alu_Result1;
            end
            else if (IsLd == 0 && IsCall == 1)
            begin
                PL.d3 = PC_Current + 4;
            end            
            else if (IsLd == 1 && IsCall == 0)
            begin
                PL.d3 = Ld_Result;
            end
        end
    end

endmodule
