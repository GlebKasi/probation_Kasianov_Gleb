
module decoder(
	input [2:0] data,
	output [7:0] results
);
	integer N = 8'b00000001;
	assign results = (N << (data[2] * 4 + data[1] * 2 + data[0]));

endmodule


