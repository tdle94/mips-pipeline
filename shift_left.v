module shift_left(inWire, outWire);

input [7:0] inWire;
output [7:0] outWire;

assign outWire = inWire << 1;

endmodule
