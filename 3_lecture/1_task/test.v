`timescale 1ns/100ps
module top();
reg	slk;
wire	res;
reg [7:0] data;

initial begin
	slk = 0;
	data = 2;
end

always begin
	#5 slk = ~slk;
	data = data + 1;
end
	even_uneven eu
	(
		.a(data),
		.b(res)
	);

initial begin
	#1000
	$display("clk=%b", slk);
	$display("data=%d", data);
	$display("res=%b", res);
	$stop;
end
endmodule

