module signExt (
    in,	//8-bit input
	out	//16-bit sign extended output
);


parameter INPUT_DWIDTH = 8;
parameter OUTPUT_DWIDTH = 16;

input 	[INPUT_DWIDTH-1:0]	in;
output 	[OUTPUT_DWIDTH-1:0] 	out;


localparam SIGN_BIT_LOCATION = INPUT_DWIDTH-1;
localparam SIGN_BIT_REPLICATION_COUNT = OUTPUT_DWIDTH - INPUT_DWIDTH;

assign out = {{SIGN_BIT_REPLICATION_COUNT{in[SIGN_BIT_LOCATION]}},in[INPUT_DWIDTH-1:0]};
endmodule
