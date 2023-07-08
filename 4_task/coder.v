module coder(
	input 	[7:0] data,
	output	[2:0] result
);

	assign result = (data[7]) ? 7 : 
			((data[6]) ? 6 : 
			((data[5]) ? 5 : 
			((data[4]) ? 4 : 
			((data[3]) ? 3 : 
			((data[2]) ? 2 : 
			((data[1]) ? 1 : 0))))));	

endmodule

