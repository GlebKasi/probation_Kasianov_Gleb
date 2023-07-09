module pwm(
	input	clk,
	input	reset,
	output 	reg	pwm_signal
);
reg [2:0]n;
always @(clk)
	if(reset)
	begin
		pwm_signal <= 0;
		n <= 0;
	end
	else
		if(n == 4)
		begin
			pwm_signal <= 1;
			n <= 0;
		end
		else
		begin
			pwm_signal <= 0;
			n <= n + 1;
		end

endmodule
