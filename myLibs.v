`timescale 1ns/10ps
`include "myGlbl.v"

/* 2-input nor gate with resource counter and time delay
 */

module my_nor(y, a, b);
  output y;
  input a, b;
  wire y;
  nor #2(y,a,b);

  global_vars gv;

  /* at instantiation increment the resources used */
 

  /* add 2ns inherent delay */

endmodule

/* 2-input and gate using my_nor
 */

module my_and(y, a, b);
  output y;
  input a, b;
  wire r1,r2;
  nor #2(r1,a,a);
  nor #2(r2,b,b);
  nor #2(y,r1,r2);
endmodule

/* 3-input and gate using my_and
 */

module my_and3(y, a, b, c);
  output y;
  input a, b, c;
  wire r1,y;
  my_and #2(r1,a,b);
  my_and #2(y,r1,c);
endmodule

/* 4-input and gate using my_and
 */

module my_and4(y, a, b, c, d);
  output y;
  input a, b, c, d;
  wire r1,r2,y;
  my_and #2(r1,a,b);
  my_and #2(r2,c,d);
  my_and #2(y,r1,r2);
  
endmodule

/* 2-input or gate using my_nor
 */

module my_or(y, a, b);
  output y;
  input a, b;
  wire y,r1;
  my_nor #2(r1,a,b);
  my_nor #2(y,r1,r1);
endmodule

/* 3-input or gate using my_or
 */

module my_or3(y, a, b, c);
  output y;
  input a, b, c;
  wire y,r1;
  my_or #2(r1,a,b);
  my_or #2(y,c,r1);

endmodule

/* 4-input or gate using my_or
 */

module my_or4(y, a, b, c, d);
  output y;
  input a, b, c, d;
  wire r1,r2,y;
  my_or #2(r1,a,b);
  my_or #2(r2,c,d);
  my_or #2(y,r1,r2);
endmodule

/* 2-input xor gate using my_nor
 */

module my_xor(y, a, b);
  output y;
  input a, b;
  wire r1,r2,r3,r4,y;
  my_nor #2(r1,a,a);
  my_nor #2(r2,b,b);
  my_nor $2(r3,a,b);
  my_nor #2(r4,r1,r2);
  my_nor #2(y,r4,r3);

endmodule
