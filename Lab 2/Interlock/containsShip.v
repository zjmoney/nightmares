module ContainsShip (clock, reset, shipDocked, arriving, departing, openDoor);
	input clock, reset, openDoor, arriving, departing;
	output shipDocked;
	
	reg [1:0] ps, ns;
	
	parameter empty  = 2'b00,
				 enter  = 2'b10,
				 exit   = 2'b01,
				 contains = 2'b11;
	
	initial ps = empty;
	initial ns = empty;
	
	assign shipDocked = ps[0];	

	always @(*) begin
		case(ps)
			empty: begin
				if(arriving | ns == enter)  ns = enter;
				else ns = empty;
			end
			enter: begin
				if(openDoor | ns == contains) ns = contains;
				else ns = enter;
			end
			exit: begin
				if(openDoor | ns == empty) ns = empty;
				else ns = exit;
			end
			contains: begin
				if(departing | ns == exit) ns = exit;
				else ns = contains;
			end
		endcase
	end
	
	always @(posedge clock) begin
		if(reset) ps <= empty;
		else ps <= ns;
	end
	
endmodule