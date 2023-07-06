
module even_uneven(
	input [7:0] a,
	output b
);
	assign b = ~a[0];
endmodule

