module divide3(
	input	[7:0]data,
	output	result
);

	assign result = (data[1] + data[3] + data[5] + data[7] - data[0] - data[2] - data[4] - data[6] == 3) | 
			(data[0] + data[2] + data[4] + data[6] - data[1] - data[3] - data[5] - data[7] == 0) | 
			(data[0] + data[2] + data[4] + data[6] - data[1] - data[3] - data[5] - data[7] == 3);

endmodule
