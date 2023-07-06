`timescale 1ns/100ps
module top();
reg	slk;
wire	[2:0]res;
reg 	[7:0] data;

initial begin
	slk = 0;
	data = 1;
end

always begin
	#5 slk = ~slk;
	data = data << 1;
end
	log2 my_log2
	(
		.data(data),
		.result(res)
	);

initial begin
	#40
	$display("clk=%b", slk);
	$display("data=%d", data);
	$display("res=%b", res);
	$stop;
end
endmodule

