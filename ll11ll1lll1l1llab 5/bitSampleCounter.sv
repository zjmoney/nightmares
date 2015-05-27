module fourBitCounter(out, clk, rst, enable);
	input clk, rst;
	input enable;
//	output shiftOut, bicOut;
//	reg [3:0] bits;
	
//	always @(posedge clk)
//		if (rst) begin
//			bits = 4'b0000;
//			bicOut = 1'b0;
//			shiftOut = 1'b0;
//			strobe <= 1'b0;
//		end else if (enable) begin
//			bits <= bits + 1'b1;
//			if (bits == 4'b0111) shiftOut <= 1'b1;
//			else if (bits == 4'b1111) bicOut <= 1'b1;
//			else if (bits == 4'b1000) strobe <= 1'b1;
//			else begin
//				shiftOut <= 1'b0;
//				bicOut <= 1'b0;
//				strobe <= 1'b0;
//			end
//			bits <= bits + 1'b1;
//		end

	output reg [3:0] out;

	always @(posedge clk or posedge rst)
		if (rst)
			out <= 4'b0000;
		else if (enable)
			out <= out + 1'b1;
		else
			out <= 4'b0000;

endmodule
