`timescale 1ns/100ps
module top();
reg	clk;
reg	res;
reg	rd_req;
reg	wr_req;
reg	[3 : 0] wr_data;
wire	[3 : 0] rd_data;
wire	val;
wire	ready;
integer ti = 0;

initial begin
	clk = 0;
	res = 1;
	#10 res = 0;
	rd_req = 1;
	wr_req = 0;
	#10;
	$display("read: valid = %b, value = %d, clock = %d", val, rd_data, ti);
	wr_req = 1;
	rd_req = 0;
	wr_data = 6;
	#10;
	$display("write: ready = %b, value = %d, clock = %d", ready, wr_data, ti);
	wr_req = 1;
	rd_req = 0;
	wr_data = 8;
	#10;
	$display("write: ready = %b, value = %d, clock = %d", ready, wr_data, ti);
	wr_req = 1;
	rd_req = 0;
	wr_data = 4;
	#10;
	$display("write: ready = %b, value = %d, clock = %d", ready, wr_data, ti);
	wr_req = 1;
	rd_req = 0;
	wr_data = 10;
	#10;
	$display("write: ready = %b, value = %d, clock = %d", ready, wr_data, ti);
	wr_req = 1;
	rd_req = 0;
	wr_data = 12;
	#10;
	$display("write: ready = %b, value = %d, clock = %d", ready, wr_data, ti);
	rd_req = 1;
	wr_req = 0;
	#10;
	$display("read: valid = %b, value = %d, clock = %d", val, rd_data, ti);
	rd_req = 1;
	wr_req = 0;
	#10;
	$display("read: valid = %b, value = %d, clock = %d", val, rd_data, ti);
	rd_req = 1;
	wr_req = 0;
	#10;
	$display("read: valid = %b, value = %d, clock = %d", val, rd_data, ti);
	rd_req = 1;
	wr_req = 0;
	#10;
	$display("read: valid = %b, value = %d, clock = %d", val, rd_data, ti);
	rd_req = 1;
	wr_req = 0;
	#10;
	$display("read: valid = %b, value = %d, clock = %d", val, rd_data, ti);			
end

always begin
	#5 clk = ~clk;
	ti = ti + 1;
end
	fifo
	#(	.FIFO_DEPTH(4),
		.DATA_WIDTH(4)
	) my_fifo
	(
		.clk(clk),
		.reset(res),
		.rd_en(rd_req),
		.wr_en(wr_req),
		.wr_data(wr_data),
		.rd_data(rd_data),
		.rd_val(val),
		.wr_ready(ready)
	);

initial begin
	#200
	$stop;
end
endmodule

