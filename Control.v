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


module Control (
    input I,
    input [4:0] Opcode,
    output [4:0] AluSignal,    
    output IsImmediate,
    output IsRet,
    output IsBgt,   
    output IsLd,             
    output IsSt,
    output IsUBranch,
    output IsBeq,
    output IsCall,
    output IsWb
);

    reg [4:0] AluSignal;
    reg IsSt, IsLd, IsBeq, IsRet, IsImmediate, IsWb, IsUBranch, IsCall, IsBgt;
    wire I;
    wire [4:0] Opcode;                 

    always @(*)
    begin
        if (I == 0)
            IsImmediate = 0;
        else 
            IsImmediate = 1;

        case (Opcode)
            5'b00000: 
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b00001: 
                begin
                    if (I == 1 && PL.Immd[31])
                        AluSignal = 5'b00000;
                    else
                        AluSignal = Opcode;

                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b00010: 
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b00011: 
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b00100: 
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b00101:
                begin
                    AluSignal = Opcode;
                    IsWb = 0;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b00110:
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b00111:
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b01000:
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b01001: 
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b01010:
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b01011:
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b01100: 
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b01101:
                begin
                    AluSignal = Opcode;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b01110:
                begin
                    AluSignal = 5'b00000;
                    IsLd = 1;
                    IsWb = 1;
                    IsSt = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b01111:
                begin
                    AluSignal = 5'b00000;
                    IsSt = 1;
                    IsWb = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                    IsBeq = 0;
                    IsBgt = 0;
                end

            5'b10000:
                begin
                    AluSignal = 5'b01101;
                    IsBeq = 1;
                    IsWb = 0;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                end

            5'b10001: 
                begin
                    AluSignal = 5'b01101;
                    IsBgt = 1;
                    IsWb = 0;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsUBranch = 0;
                    IsCall = 0;
                end

            5'b10010: 
                begin
                    AluSignal = 5'b01101;
                    IsUBranch = 1;
                    IsWb = 0;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                    IsCall = 0;
                end

            5'b10011:
                begin
                    AluSignal = 5'b01101;
                    IsUBranch = 1;
                    IsCall = 1;
                    IsWb = 1;
                    IsSt = 0;
                    IsLd = 0;
                    IsRet = 0;
                end

            5'b10100:           
                begin
                    AluSignal = 5'b01101;
                    IsUBranch = 1;
                    IsRet = 1;
                    IsWb = 0;
                    IsSt = 0;
                    IsLd = 0;
                    IsCall = 0;
                end  

        endcase
    end

endmodule
