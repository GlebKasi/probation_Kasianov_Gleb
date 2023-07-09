`timescale 1ns/100ps
module top();
reg	clk;
reg	res;
wire	clk_div2;
wire	clk_div4;
wire	clk_div8;

initial begin
	clk = 0;
	res = 1;
	#10 res = 0;
end

always begin
	#5 clk = ~clk;
end
	divide_signal my_divide_signal
	(
		.clk(clk),
		.reset(res),
		.clk_div2(clk_div2),
		.clk_div4(clk_div4),
		.clk_div8(clk_div8)
	);

initial begin
	#1000
	$stop;
end
endmodule

