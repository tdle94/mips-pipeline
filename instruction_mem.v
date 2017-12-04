module instruction_mem(
    input [7:0] address,
    input clk, rst,
    output reg [15:0] instruction
);


reg [15:0] memory[0:27];

always@(posedge clk or negedge rst) begin
    if (!rst) begin
        memory[0] <= 16'b1111000100100000;
        memory[1] <= 16'b1111000100100001;
        memory[2] <= 16'b1001001111111111;
        memory[3] <= 16'b1000001101001100;
        memory[4] <= 16'b1111010101100100;
        memory[5] <= 16'b1111001001010101;
        memory[6] <= 16'b1111111111110001;
        memory[7] <= 16'b1111010010000111;
        memory[8] <= 16'b1111010001101000;
        memory[9] <= 16'b1001001011111111;
        memory[10] <= 16'b1010011010010100;
        memory[11] <= 16'b1011011010010110;
        memory[12] <= 16'b1100011010010110;
        memory[13] <= 16'b0110011100000100;
        memory[14] <= 16'b1111101100010000;
        memory[15] <= 16'b0101011100000101;
        memory[16] <= 16'b1111110000100000;
        memory[17] <= 16'b0100011100000010;
        memory[18] <= 16'b1111000100010000;
        memory[19] <= 16'b1100100010010000;
        memory[20] <= 16'b1111100010000000;
        memory[21] <= 16'b1101100010010010;
        memory[22] <= 16'b1100101010010010;
        memory[23] <= 16'b1100101010010010;
        memory[24] <= 16'b1111110011000000;
        memory[25] <= 16'b1111110111010001;
        memory[26] <= 16'b1111110011010000;
    end
    else begin
        instruction = memory[address/2];
    end
end
endmodule
