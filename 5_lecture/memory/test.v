`timescale 1ns/100ps
module top();
reg	clk;
reg	rd_req;
reg	wr_req;
reg	[1 : 0]	rd_addr;
reg	[1 : 0]	wr_addr;
reg	[3 : 0] wr_data;
wire	[3 : 0] rd_data;
integer ti = 0;

initial begin
	clk = 0;	
	rd_req = 0;	
	wr_req = 1;
	wr_addr = 2;
	wr_data = 3;
	#10;
	$display("write: addr = %d, walue = %d, clock = %d", wr_addr, wr_data, ti);
	rd_req = 0;	
	wr_req = 1;
	wr_addr = 1;
	wr_data = 15;
	#10;
	$display("write: addr = %d, walue = %d, clock = %d", wr_addr, wr_data, ti);
	rd_req = 1;
	wr_req = 0;
	rd_addr = 2;
	#10;
	$display("read: addr = %d, walue = %d, clock = %d", rd_addr, rd_data, ti);
	rd_req = 1;
	wr_req = 1;
	rd_addr = 1;
	wr_addr = 3;
	wr_data = 9;
	#10;
	$display("write: addr = %d, walue = %d, clock = %d", wr_addr, wr_data, ti);
	$display("read: addr = %d, walue = %d, clock = %d", rd_addr, rd_data, ti);
	rd_req = 1;
	wr_req = 1;
	rd_addr = 3;
	wr_addr = 3;
	wr_data = 7;	
	#10;
	$display("write: addr = %d, walue = %d, clock = %d", wr_addr, wr_data, ti);
	$display("read: addr = %d, walue = %d, clock = %d", rd_addr, rd_data, ti);
	rd_req = 1;
	wr_req = 0;
	rd_addr = 3;
	#10;
	$display("read: addr = %d, walue = %d, clock = %d", rd_addr, rd_data, ti);	
end

always begin
	#5 clk = ~clk;
	ti = ti + 1;
end
	memory
	#(	.DATA_WIDTH(4),
		.MAX_ADDR(4)
	) my_memory
	(
		.clk(clk),
		.rd_en(rd_req),
		.rd_addr(rd_addr),
		.wr_en(wr_req),
		.wr_addr(wr_addr),
		.wr_data(wr_data),
		.rd_data(rd_data)
	);

initial begin
	#100
	$stop;
end
endmodule

