module memory
#(
	parameter 	DATA_WIDTH 	= 1,
	parameter 	MAX_ADDR	= 2,
	parameter 	ADDRSIZE 	= $clog2(MAX_ADDR)
)
(
	input	wire				clk,
	input 	wire				rd_en,
	input	wire	[ADDRSIZE - 1 : 0]	rd_addr,
	input 	wire				wr_en,
	input 	wire	[ADDRSIZE - 1 : 0] 	wr_addr,
	input 	wire	[DATA_WIDTH - 1 : 0] 	wr_data,
	output 	wire 	[DATA_WIDTH - 1 : 0] 	rd_data
);

reg	[DATA_WIDTH - 1 : 0]	read;
reg 	[MAX_ADDR - 1 : 0]	mem	[DATA_WIDTH - 1 : 0];
assign	rd_data = read;

always @(posedge clk)
begin
	if (rd_en)
	begin
		read <= mem[rd_addr];
	end
	if (wr_en)
	begin
		mem[wr_addr] <= wr_data;
	end
end
endmodule
