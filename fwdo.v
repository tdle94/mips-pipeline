module fwd0(
    input [31:0] aluMux0, fwdALU,
    input fwdA,
    output reg [31:0] aluSrc0
);

always@(*) begin
    if (fwdA) begin
        aluSrc0 = aluMux0;
    end
    else begin
        aluSrc0 = fwdALU;
    end
end

endmodule