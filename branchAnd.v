module branchAnd (input compResult, branch, output reg pc_source);

always @(*) begin
	pc_source <= compResult & branch;
end
endmodule
