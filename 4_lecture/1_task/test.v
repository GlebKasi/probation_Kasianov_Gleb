`timescale 1ns/100ps
module top();
reg	clk;
reg	res;
wire	clk_div6;

initial begin
	clk = 0;
	res = 1;
	#10 res = 0;
end

always begin
	#5 clk = ~clk;
end
	gen6 my_gen6
	(
		.clk(clk),
		.reset(res),
		.signal(clk_div6)
	);

initial begin
	#1000
	$stop;
end
endmodule

