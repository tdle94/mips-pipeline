module nBitAdder(f, cOut, a, b, cIn);
  parameter n = 15;

  output reg [n:0] f;
  output reg cOut;
  input [n:0] a;
  input [n:0] b;
  input cIn;

  always @(*) begin
    f = a + b + cIn;
  end
endmodule
