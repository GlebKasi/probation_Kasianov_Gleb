
module log2(
	input [7:0] data,
	output [2:0] result
);

	assign result[0] = data[1] | data[3] | data[5] | data[7];
	assign result[1] = data[2] | data[3] | data[6] | data[7];
	assign result[2] = data[4] | data[5] | data[6] | data[7];

endmodule




