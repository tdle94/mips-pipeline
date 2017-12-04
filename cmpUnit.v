module cmpUnit(
    input [15:0] a, b,
    output reg cmpResult
);

always@(*) begin
    if (a == b || a < b || a > b) begin
        cmpResult = 1;
    end
    else begin
        cmpResult = 0;
    end
end

endmodule
