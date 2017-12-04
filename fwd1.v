module fwd1(
    input [15:0] SwapSrc1, FwdALU,
    input FwdB,
    output reg [15:0] AluSrc1
);

always@(*) begin
    if (FwdB) begin
        AluSrc1 = FwdALU;
    end
    else begin
        AluSrc1 = SwapSrc1;
    end
end

endmodule
