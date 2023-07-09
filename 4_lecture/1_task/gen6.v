module gen6(
	input	clk,
	input 	reset,
	output	reg 	signal
);
reg	[2:0]	n;
always @(posedge clk)
if(reset)
begin
	signal <= 1'b0;
	n <= 1'b000;
end
else
	if(n == 2)
	begin
		signal <= ~signal;
		n <= 1'b000; 
	end
	else
		n <= n + 1;
endmodule
