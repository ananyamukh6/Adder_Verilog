/******************************************************************************
@ddblock_begin copyright

Copyright (c) 1999-2010
Maryland DSPCAD Research Group, The University of Maryland at College Park

Permission is hereby granted, without written agreement and without
license or royalty fees, to use, copy, modify, and distribute this
software and its documentation for any purpose, provided that the above
copyright notice and the following two paragraphs appear in all copies
of this software.

IN NO EVENT SHALL THE UNIVERSITY OF MARYLAND BE LIABLE TO ANY PARTY
FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF
THE UNIVERSITY OF MARYLAND HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

THE UNIVERSITY OF MARYLAND SPECIFICALLY DISCLAIMS ANY WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE
N AN "AS IS" BASIS, AND THE UNIVERSITY OF
MARYLAND HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES,
ENHANCEMENTS, OR MODIFICATIONS.

@ddblock_end copyright
******************************************************************************/

`timescale 1ns/10ps

module driver(a, b, carry_in, sum, carry_out);

    output reg a;
    output reg b;
    output reg carry_in;
    input sum;
    input carry_out;

    integer descr;

    initial begin
        descr = $fopen("out.txt");
        $fmonitor(descr, "a: %d, b: %d, carry_in: %d, sum: %d, carry_out: %d",
            a, b, carry_in, sum, carry_out);
    end

    initial begin		 
        a = 0; b = 1; carry_in = 0;
        #10
        a = 0; b = 0; carry_in = 0;
        #10
        a = 1; b = 0; carry_in = 1;
        #10
        a = 1; b = 1; carry_in = 0;
    end

endmodule
