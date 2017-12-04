module aluMux0(
    input [15:0] OutDataOp1, OutSignExtImmd,
    input ALUSel0,
    output reg [15:0] src
);

always@(*) begin
    if (ALUSel0) begin
        src = OutSignExtImmd;
    end
    else begin
        src = OutDataOp1;
    end
end

endmodule
