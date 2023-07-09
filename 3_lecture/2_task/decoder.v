
module decoder(
	input [2:0] data,
	output [7:0] result
);
	assign result = (8'b00000001 << data);

endmodule


