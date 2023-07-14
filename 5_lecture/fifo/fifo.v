module fifo
#(
	parameter	FIFO_DEPTH 	= 1,
	parameter	DATA_WIDTH 	= 1,
	parameter	FIFO_MAX_ADDR 	= $clog2(FIFO_DEPTH)
)
(
	input	clk,
	input	reset,
	input	rd_en,
	input	wr_en,
	input	[DATA_WIDTH - 1 : 0]	wr_data,
	output	wire	[DATA_WIDTH - 1 : 0]	rd_data,
	output	wire	rd_val,
	output	wire	wr_ready
);

reg	val;
reg	[DATA_WIDTH - 1 : 0]	read;
reg	[FIFO_MAX_ADDR : 0]	busy;
reg	[FIFO_DEPTH - 1 : 0]	mem	[DATA_WIDTH - 1 : 0];
assign 	rd_data 	= read;
assign	rd_val		= val;
assign	wr_ready	= (busy != FIFO_DEPTH); 

genvar i;
generate 
	for(i = 1; i < FIFO_DEPTH; i = i + 1) 
	begin: switch 
		always @(posedge clk)
			if((~reset) && (rd_en))
				mem[i - 1] <= mem[i];
	end
endgenerate

always @(posedge clk)
begin
	if (reset)
	begin
		busy <= 0;
		val <= 0;
	end
	else
	begin
		if (rd_en)
		begin
			read <= mem[0];
			busy <= (busy != 0) ? (busy - 1) : (0);
			val <= (busy != 0); 
		end
		if ((wr_en) && (busy != FIFO_DEPTH)) 
		begin
			mem[busy] = wr_data;
			busy <= busy + 1;
			val <= (busy != 0);
		end
		
	end
end
endmodule
