`timescale 1ns/100ps
module top();
reg	slk;
wire	[7:0]res;
reg [2:0] data;

initial begin
	slk = 0;
	data = 0;
end

always begin
	#5 slk = ~slk;
	data = data + 1;
end
	decoder dc
	(
		.data(data),
		.results(res)
	);

initial begin
	#40
	$display("clk=%b", slk);
	$display("data=%d", data);
	$display("res=%b", res);
	$stop;
end
endmodule

