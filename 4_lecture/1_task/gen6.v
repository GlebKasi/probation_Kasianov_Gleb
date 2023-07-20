module gen6(
	input	clk,
	input 	reset,
	output	reg 	signal
);
reg	[1:0]	n;
always @(posedge clk)
if(reset)
begin
	signal <= 1'b0;
	n <= 2'b00;
end
else
	if(n == 2)
	begin
		signal <= ~signal;
		n <= 2'b00; 
	end
	else
		n <= n + 1;
endmodule
