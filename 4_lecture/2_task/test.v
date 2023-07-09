`timescale 1ns/100ps
module top();
reg	clk;
reg	res;
wire	pwm_signal;

initial begin
	clk = 0;
	res = 1;
	#10 res = 0;
end

always begin
	#5 clk = ~clk;
end
	pwm my_pwm
	(
		.clk(clk),
		.reset(res),
		.pwm_signal(pwm_signal)
	);

initial begin
	#1000
	$stop;
end
endmodule

