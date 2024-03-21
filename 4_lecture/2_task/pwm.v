module pwm(
	input	clk,
	input	reset,
	output 	reg	pwm_signal
);
reg [2:0]n;
always @(posedge clk)
begin
	pwm_signal <= (reset) ? 0 : (n == 4) ? 1 : 0;
end

always @(posedge clk)
begin
	n <= (reset) ? 0 : (n == 4) ? 0 : n + 1;
end
endmodule
