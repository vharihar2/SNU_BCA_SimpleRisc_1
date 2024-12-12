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



*/
//////////////////////////////////////////////////////////////////////////////////


module Memory(
    input rw,
    input [31:0] a_m1,
    input [31:0] a_m2,
    input [31:0] d_m3,
    output [31:0] d_m1,
    output [31:0] d_m2
);

    integer x;
    reg [31:0] z1, z2;
    reg [7:0] Memory [16'h1000:0]; 
    reg [31:0] d_m1, d_m2; 
    wire rw;  
    wire [31:0] a_m1, a_m2, a_m3;

    always @(a_m1)
    begin
        z1 = a_m1;
        for (x = 0; x < 4; x = x + 1)
        begin
            d_m1[8 * x +: 8] = Memory[z1];
            z1 = z1 + 1;
        end
    end

    always @(a_m2)
    begin
        z2 = a_m2;
        if (rw == 1)
        begin
            for (x = 0; x < 4; x = x + 1)
            begin
                Memory[z2] <= d_m3[8 * x +: 8];
                z2 = z2 + 1;
            end
        end
        else if (rw == 0)
        begin
            for (x = 0; x < 4; x = x + 1)
            begin
                d_m2[8 * x +: 8] = Memory[z2];
                z2 = z2 + 1;
            end
        end
    end

endmodule


