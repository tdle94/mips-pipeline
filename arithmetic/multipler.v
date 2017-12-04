module multipler(lowerProd, upperProd, multiplier, multiplicand);

input [15:0] multiplier, multiplicand;
output reg [15:0] lowerProd;
output reg [16:31] upperProd;

reg [31:0] prod;

integer i;

always@(multiplier or multiplicand) begin
    prod = 0;
    for (i = 0; i < 16; i = i + 1)
        if (multiplier[i] == 1'b1) begin
            prod = prod + (multiplicand << i);
            lowerProd = prod[15:0];
            upperProd = prod[31:16];
        end
end

endmodule
