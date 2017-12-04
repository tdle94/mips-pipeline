`include "arithmetic/divider.v"
`include "arithmetic/nBitAdder.v"
`include "arithmetic/multipler.v"
`include "arithmetic/andOp.v"
`include "arithmetic/orOp.v"

module alu(
    input [15:0] a, b,              // operand
    input  [3:0] control,
    output reg [15:0] op1, r15 // op1 is alu result and r15 is remainder or upper half of product
);


wire [15:0] addResult,          // add result
            subResult,          // sub result
            andResult,          // and result
            orResult,           // or result
            quotient, remainder,    // divison result
            prodLower, prodUpper;       // mult result
wire co;         	// carry out for addition
integer i;
reg [31:0] prod;
always@(*) begin
    case (control)
	4'b0110: begin   
		op1 = a & b; // And
	end
	4'b0111: begin
		op1 = a | b; // Or
	end
	4'b0000: begin  
		op1 = a + b; // Add
	end
	4'b0001: begin    
		op1 = a - b;  // Subtract
	end
	4'b0011: begin            // Divide
            op1 = a/b;
            r15 = a - (b * op1);
	end
	4'b0010: begin            // Multiply
	   /*prod = 32'h00000000;
	   for (i = 0; i < 16; i = i + 1)
		   if (op1[i] == 1'b1) begin
			prod = prod + (b << i);
			r15 = prod[31:17];
			op1 = prod[16:1];
		   end*/
		  op1 = prodLower;
		  r15 = prodUpper;
	end
	4'b1000: begin
		op1 = a + b; 	      // load, store, lbu and sb (addition)
	end
	default: begin            // default
            r15 = 15'h0000;
	end
    endcase
end

multipler mult(prodLower, prodUpper, a, b);             // instantiate mult module

endmodule
