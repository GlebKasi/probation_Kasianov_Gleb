module genn
#(
	parameter	N = 2,
	parameter	SIZE_REG = $clog2(N / 2 - 1)
)
(
	input	clk,
	input 	reset,
	output	reg 	signal
);
reg	[SIZE_REG : 0]	n;
always @(posedge clk)
if(reset)
begin
	signal <= 0;
	n <= 0;
end
else
	if(n == N / 2 - 1)
	begin
		signal <= ~signal;
		n <= 0; 
	end
	else
		n <= n + 1;
endmodule
