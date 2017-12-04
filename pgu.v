module pgu(
input [15:0] a, b,
output reg [15:0] p, g
);
always@(*) begin
p = a ^ b;
g = a & b;
end
endmodule
module su_16bits(p, c, s);
input [15:0] p, c;
output reg [15:0] s;
always@(*) begin
s = p ^ c;
end
endmodule
