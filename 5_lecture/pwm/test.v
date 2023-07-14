`timescale 1ns/100ps
module top();
reg	clk;
reg	res;
wire	[39 : 0]	clk_div;

initial begin
	clk = 0;
	res = 1;
	#10 res = 0;
end

always begin
	#5 clk = ~clk;
end

genvar i;
generate for (i = 1; i <= 40; i = i + 1) begin: test_loop
	pwmn 
	#(	.N(i)
	)
	my_pwmn
	(
		.clk(clk),
		.reset(res),
		.pwm_signal(clk_div[i - 1])
	);
	end
endgenerate

initial begin
	#5000
	$stop;
end
endmodule
