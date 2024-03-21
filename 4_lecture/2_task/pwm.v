module pwm(
	input	clk,
	input	reset,
	output 	wire	pwm_signal
);
reg [2:0]n;

assign	pwm_signal = (n == 4) ? 1 : 0;

always @(posedge clk)
begin
	n <= (reset) ? 0 : (n == 4) ? 0 : n + 1;
end
endmodule
