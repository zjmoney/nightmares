// Ripple up Counter

`include "flipflop.v"

module RippleUp(rst, clk, out);
	input clk, rst;
	output [3:0] out;

	wire qBar1, qBar2, qBar3, qBar4;
	
	DFlipFlop flip1(out[0], qBar1, qBar1, clk, rst);
	DFlipFlop flip2(out[1], qBar2, qBar2, qBar1, rst);
	DFlipFlop flip3(out[2], qBar3, qBar3, qBar2, rst);
	DFlipFlop flip4(out[3], qBar4, qBar4, qBar3, rst);
endmodule

