`timescale 1ns/100ps
module top();
reg	clk;
reg	res;
wire	[20 : 0]	clk_div;

initial begin
	clk = 0;
	res = 1;
	#10 res = 0;
end

always begin
	#5 clk = ~clk;
end

genvar i;
generate for (i = 1; i <= 20; i = i + 1) begin: test_loop
	genn 
	#(	.N(i * 2)
	)
	my_gen
	(
		.clk(clk),
		.reset(res),
		.signal(clk_div[i - 1])
	);
	end
endgenerate

initial begin
	#5000
	$stop;
end
endmodule
