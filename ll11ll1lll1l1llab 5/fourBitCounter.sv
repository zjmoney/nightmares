module fourBitCounter(shiftOut, strobeOut, clk, rst, enable);
	input clk, reset;
	input enable;
	output shiftOut, strobeOute;
	reg [3:0] bits;
	
	always @(posedge clk)
		if (rst) begin
			bits = 4'b0000;
			strobeOut = 1'b0;
			shiftOut = 1'b0;
		end else if (enable) begin
			bits <= bits + 1'b1;
			if (bits == 4'b0111) shiftOut <= 1'b1;
			else if (bits == 4'b1111) strobeOut <= 1'b1;
			else begin
				shiftOut <= 1'b0;
				strobeOut <= 1'b0;
			end
			bits <= bits + 1'b1;
		end
endmodule
