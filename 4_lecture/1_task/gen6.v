module gen6(
	input	clk,
	input 	reset,
	output	reg 	signal
);
reg	[1:0]	n;
always @(posedge clk)
begin
	signal <= (reset) ? 1'b0 : (n == 2) ? ~signal : signal;
end

always @(posedge clk)
begin
	n <= (reset | n == 2) ? 2'b00 : n + 1;
end
endmodule
