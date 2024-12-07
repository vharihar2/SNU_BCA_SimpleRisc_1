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


`define td 1000

module Test_Pipeline();

    integer x1, x2, x3;
    integer File, Filex, temp, c = 0;
    reg [64:0] Buff[32'h1000:0];
    reg Clk;

    Pipeline PL (.Clk(Clk));

    initial
    begin
        Clk = 0;
        x2 = 1;
        x3 = 0;
        PL.Reset = 1;

        Filex = $fopen("Memory.mem", "r");
        temp = $fgetc(Filex);
        while (!$feof(Filex))
        begin
            if (temp == "\n")
                c = c + 1;
            temp = $fgetc(Filex);
        end

        $readmemh("Memory.mem", Buff, 0, c * 2 - 1);

        for (x1 = 0; x1 < 32'h1000; x1 = x1 + 1)
        begin
            if (x3 == 4)
            begin
                x3 = 0;
                x2 = x2 + 2;
            end
            PL.M.Memory[x1] = Buff[x2][8 * x3 +: 8];
            x3 = x3 + 1;
        end

        #1 PL.Reset = 0;

        #`td
        $finish;
    end

    initial
    begin
        #`td
        File = $fopen("C:\\Users\\pants\\simplerisc project\\Output_File.txt", "w");
        $fdisplay(File, "\tUpdated Registers\t\n");

        for (x1 = 0; x1 < 16; x1 = x1 + 1)
        begin
            $fdisplay(File, "\tR=[%d] = %h\n", x1, PL.RF.Regs[x1]);
        end

        $fdisplay(File, "\n\tUpdated Memory\t\n");

        for (x1 = 0; x1 < 32'h1000; x1 = x1 + 1)
        begin
            $fdisplay(File, "\tA=%h D=%h \n", x1, PL.M.Memory[x1]);
        end

        $fclose(File);
    end

    always
    begin
        #5 Clk = ~Clk;
    end

endmodule
