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
`include "../../../src/myGlbl.v"

module sample_cla_testbench;

    reg [15:0] a;
    reg [15:0] b;
    reg carry_in;
    wire [15:0] sum;
    wire  carry_out;

    integer descr;
    integer resources;

	cla_adder16 adder16(sum, carry_out, a, b, carry_in);
	
    initial begin
        descr = $fopen("out.txt");
	//resources = global_vars.count;
	/* print the number of gates used. */
	//$fdisplay(descr, "NOR Gates = %d", resources);
        $fmonitor(descr, "%0d - a: %d, b: %d, carry_in: %d, sum: %d, carry_out: %d",
            $time, a, b, carry_in, sum, carry_out);
    end

    initial begin		 
     	a = 16'd7; b = 16'd7; carry_in = 0;
	 //  a = 16'd32000; b = 16'd15000; carry_in = 0;
        #100
     	a = 16'd1; b = 16'd1; carry_in = 0;
	 //  a = 16'd32000; b = 16'd15000; carry_in = 0;
        #100
     	a = 16'd2; b = 16'd2; carry_in = 0;
	 //  a = 16'd32000; b = 16'd15000; carry_in = 0;
        #100
	a = 16'd125; b=125; carry_in = 0;
       // a = 16'd11111; b = 16'd11111; carry_in = 1;
        #100
	a = 2000; b = 2000; carry_in = 0;
      //  a = 16'd10101; b = 16'd01010; carry_in = 1;
        #100
	a = 1000; b = 1000; carry_in = 0;
	#100
	a = 30000; b = 30000; carry_in = 0;
      //  a = 16'd50000; b = 16'd499; carry_in = 1;
    end

endmodule
