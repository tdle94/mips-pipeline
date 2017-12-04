module fwd0(
    input [15:0] SwapSrc0, FwdALU,
    input FwdA,
    output reg [15:0] AluSrc0
);

always@(*) begin
    if (FwdA) begin
        AluSrc0 = FwdALU;
    end
    else begin
        AluSrc0 = SwapSrc0;
    end
end

endmodule
