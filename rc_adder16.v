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
PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND THE UNIVERSITY OF
MARYLAND HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES,
ENHANCEMENTS, OR MODIFICATIONS.

@ddblock_end copyright
******************************************************************************/
`timescale 1ns/10ps
`include "myGlbl.v"

/* 16-bit ripple carry adder.
 * modified for use with my_nand
 */

module rc_adder16(sum, carry_out, a, b, carry_in);
    output [15:0] sum;
    output carry_out;
    input [15:0] a;
    input [15:0] b;
    input carry_in;

    wire [15:0] c;

    assign carry_out = c[15];

    full_adder fa0(sum[0], c[0], a[0], b[0], carry_in);
    full_adder fa1(sum[1], c[1], a[1], b[1], c[0]);
    full_adder fa2(sum[2], c[2], a[2], b[2], c[1]);
    full_adder fa3(sum[3], c[3], a[3], b[3], c[2]);
    full_adder fa4(sum[4], c[4], a[4], b[4], c[3]);
    full_adder fa5(sum[5], c[5], a[5], b[5], c[4]);
    full_adder fa6(sum[6], c[6], a[6], b[6], c[5]);
    full_adder fa7(sum[7], c[7], a[7], b[7], c[6]);
    full_adder fa8(sum[8], c[8], a[8], b[8], c[7]);
    full_adder fa9(sum[9], c[9], a[9], b[9], c[8]);
    full_adder fa10(sum[10], c[10], a[10], b[10], c[9]);
    full_adder fa11(sum[11], c[11], a[11], b[11], c[10]);
    full_adder fa12(sum[12], c[12], a[12], b[12], c[11]);
    full_adder fa13(sum[13], c[13], a[13], b[13], c[12]);
    full_adder fa14(sum[14], c[14], a[14], b[14], c[13]);
    full_adder fa15(sum[15], c[15], a[15], b[15], c[14]);
endmodule

/* 1-bit full adder.
 * modify for use with my_nand
 */

module full_adder(sum, carry_out, a, b, carry_in);
    output sum, carry_out;
    input a, b, carry_in;

    //sum = a xor b xor c;
    //carry_out = carry_in(a + b) + ab;

    my_xor xor1(w1, a, b);
    my_xor xor2(sum, w1, carry_in);
    my_and and1(w2, w1, carry_in);
    my_and and2(w3, a, b);
    my_or or1(carry_out, w2, w3);
    
endmodule

