module divider(
    input [15:0] dividend, divider,
    output reg [15:0] quotient,
    output [15:0] remainder
);

reg [31:0] dividend_copy, divider_copy, diff;
assign remainder = dividend_copy[15:0];

// initialize
initial begin
	quotient = 0;
	dividend_copy = {16'd0, dividend};
	divider_copy = {1'b0, divider, 15'd0};
end
always@(*) begin
    diff = dividend_copy - divider_copy;
    quotient = {quotient[14:0], ~diff[31]};
    divider_copy = {1'b0, divider_copy[31:1]};
    if (!diff[31])
        dividend_copy = diff;
end

endmodule
