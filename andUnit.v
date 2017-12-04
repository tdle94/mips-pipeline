module andUnit(
	input CmpResult, Branch,
	output PCsrc
);

assign PCsrc = CmpResult & Branch;
endmodule
