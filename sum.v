module sum(p, c, s);
input [15:0] p, c;
output reg [15:0] s;
always@(*) begin
s = p ^ c;
end
endmodule
