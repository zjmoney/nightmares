//-----------------------------------------------------------
// Module name:
// Johnson
//
// Description:
// Module implemented as Johnson counter.
// Counts using the Johnson method.
// 
// Author(s):
// Zach Nehrenberg
// Krista Holden
//
//----------------------------------------------------------- 

module Johnson(rst, clk, out);
	input clk, rst;
	output reg [3:0] out;
	reg [3:0] ns;
	
	parameter s0 = 4'b0000;
	parameter s1 = 4'b0001;
	parameter s2 = 4'b0011;
	parameter s3 = 4'b0111;
	parameter s4 = 4'b1111;
	parameter s5 = 4'b1110;
	parameter s6 = 4'b1100;
	parameter s7 = 4'b1000;
	
	always@(posedge clk or negedge rst) begin
		if(~rst)
			out <= 4'b0000;
		else
			out <= ns;
	end
	
	always@(*) begin
		case(out)
			s0: ns = s1;
			s1: ns = s2;
			s2: ns = s3;
			s3: ns = s4;
			s4: ns = s5;
			s5: ns = s6;
			s6: ns = s7;
			s7: ns = s0;
			default: ns = s0;
		endcase
	end
endmodule
