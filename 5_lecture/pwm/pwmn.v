module pwmn
#(
	parameter	N = 2,
	parameter	SIZE_REG = $clog2(N)
)
(
	input	clk,
	input	reset,
	output 	wire	pwm_signal
);
reg	[SIZE_REG : 0]	n;

assign	pwm_signal = ((n == 1) && clk) || ((n == 0) && ~clk);

always @(posedge clk)
	if(reset)
		n <= 0;
	else
		if(n >= N - 1)
			n <= n - (N - 1);
		else
			n <= n + 2;

endmodule
