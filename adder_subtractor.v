`include "pgu.v"
`include "cgu.v"
`include "sum.v"
module adder_subtractor_16bits(
 ci, // carry in
 a, b, // 32-bits a and b
 s, // result of a +/- b
 co // carry out at 15 bit position
);

input [15:0] a, b;
input ci;
output [15:0] s;
output reg co;

wire [15:0] p, g; // output from pgu
wire [15:0] c;
always@(*) begin
co = c[15];
end
pgu pgu(a, b, p, g);
cgu cgu(p, g, ci, c);
sum su(p, {c[14:0], ci}, s);
endmodule
