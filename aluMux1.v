module aluMux1(
    input [15:0] OutDataOp2, OutConcatZero,
    input ALUSel1,
    output reg [15:0] src
);

always@(*) begin
    if (ALUSel1) begin
        src = OutConcatZero;
    end
    else begin
        src = OutDataOp2;
    end
end

endmodule
