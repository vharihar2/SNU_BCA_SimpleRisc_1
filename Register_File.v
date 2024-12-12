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


module Register_File(
    input Reset,
    input Clk,
    input IsWb,
    input [3:0] a1,
    input [3:0] a2,
    input [3:0] a3,
    input [31:0] d3,
    output [31:0] d1,
    output [31:0] d2
);
    wire Reset, Clk;
    wire IsWb;    
    wire [3:0] a1, a2, a3;
    wire [31:0] d3;
    reg [31:0] Regs [15:0];
    reg [31:0] d1, d2;
    reg [15:0] x;

    always @(Reset)
    begin
        if (Reset == 1)
        begin
            for (x = 0; x < 16; x = x + 1)
            begin
                if (x != 14)
                    Regs[x] = 32'b0;
                else
                    Regs[x] = 32'h1000;
            end
        end
    end

    always @(posedge Clk)
    begin
        if (Reset != 1 && IsWb == 1)
            Regs[a3] <= d3;
    end
    
    always @(Clk or a1 or a2)
    begin
        if (Reset != 1 && Clk == 0)
        begin
            d1 = Regs[a1];
            d2 = Regs[a2];
        end
    end
   
endmodule
