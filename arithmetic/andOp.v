module andOp( input [15:0] a, b,
		output reg [15:0] out);


integer i;
//for (i = 0; i < 7; i= i+1)
    assign b = 16'h0000;

always@(*) begin
    for (i = 0; i < 16;i= i+1)
        out[i] = a[i] & b[i];
end

endmodule
