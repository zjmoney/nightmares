//-----------------------------------------------------------
// Module name:
// DE1_SoC
//
// Description:
// 
// Author(s):
// Cody Ohlsen
// Zach Nehrenberg
// Krista Holden
//
//----------------------------------------------------------- 
module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW); 
	 input CLOCK_50;
	 output reg [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
	 output [9:0] LEDR; 
	 input [3:0] KEY; 
	 input [9:0] SW; 
	 
	 // User input wire assignments
	 wire downloadInput	=  SW[0];
	 wire reset 			= ~KEY[0];
	 
	 // Synchronized User Input Wires
	 wire downloadInputUI;
	 wire resetUI;

	 // Camera wires:
	 // Each camera has a series of variables associated with it.
	 // All inputs are active high and all outputs are active low.
	 //	displayCam:
	 //		Output to the HEX display the current
	 //		state of the camera
	 //	displayCamPercent:
	 //		Output to the HEX display the current
	 //		percentage the camera's buffer is full.
	 //		Outputs only one value (i.e. 1 = 10 %)
	 //	percentCamera:
	 //		The percentage passed into the camera
	 //		of its buffer that has been filled, as
	 //		a number.
	 //	camOutSignals:
	 //		Signals such as 50%, standby, or start filming
	 //		Other cameras can take in these signals to know
	 //		when to start operations.
	 //	camStandby and camFilm:
	 //		Signals that the camera has recieved a go to 
	 //		standby request or a start filming request
	 wire [6:0] displayCam1;
	 wire [6:0] displayCam1Percent;
	 wire [3:0] percentCamera1;
	 wire [2:0] cam1OutSignals;
	 wire cam1Standby, cam1Film;

	 wire [6:0] displayCam2;
	 wire [6:0] displayCam2Percent;
	 wire [3:0] percentCamera2;
	 wire [2:0] cam2OutSignals;
	 wire cam2Standby, cam2Film;
	 
	 // Default camera behavios
	 // 	1 = start cam on reset, 0 = not
	 parameter defaultCam1Behavior = 1'b1;
	 parameter defaultCam2Behavior = 1'b0;
	 
	 // Percentage control wires
	 //	emptyBuffer:
	 //		Controls whether the buffer should be filling
	 //		or emptying. On high the buffer will count
	 //		backwards to zero.
	 //	pauseBuffer:
	 //		Specifies whether the buffer being filled should
	 //		pause filling itself or emptying itself.
	 wire emptyBuffer1, emptyBuffer2;
	 wire pauseBuffer1, pauseBuffer2;
	 

	 // HEX assignments
	 parameter blank = 7'b1111111;
	 assign HEX0 = displayCam2Percent;
	 assign HEX1 = displayCam2;
	 
	 assign HEX2 = blank;
	 assign HEX3 = blank;
	 
	 assign HEX4 = displayCam1;
	 assign HEX5 = displayCam1Percent;
	 
	 // LEDR assignments
	 assign LEDR[9] = ~cam1Standby;
	 assign LEDR[8] = ~cam1Film;
	 
	 assign LEDR[4] = ~cam2Standby;
	 assign LEDR[3] = ~cam2Film;
	 
	 
	 
	 // Generate clk off of CLOCK_50, whichClock picks rate.
	 // Rate determines buffer fill and empty rate
	 wire [31:0] clk;
	 parameter whichClock = 7;
	 
	 // Clock 6 used in operation for the buffer, but for debugging
	 // clock 7 can be used to keep more time between states.
	 wire clock = clk[whichClock];
	 
	 ClockDivider cdiv (CLOCK_50, clk);	 
	 
	 // Percent filled buffer displays
	 CountUp countUpCam1 ( percentCamera1, displayCam1Percent );
	 CountUp countUpCam2 ( percentCamera2, displayCam2Percent );
	 
	 // Sends all asynchronous input through a DFF
	 DFlipFlop downloadStuff ( downloadInputUI , downloadInput, clock, resetUI);
	 UserInput resetInput (clock, reset, resetUI );
	  
	 // Instantiates buffer filler percent loaded feedback
	 Percents cam1Percent  (clock, resetUI, emptyBuffer1, pauseBuffer1, percentCamera1);
	 Percents cam2Percent  (clock, resetUI, emptyBuffer2, pauseBuffer2, percentCamera2);
	 
	 // Initialize cameras
	 Camera camera1  (cam1Standby, cam1Film, pauseBuffer1, emptyBuffer1, displayCam1, cam1OutSignals, resetUI, clock, downloadInputUI, cam2OutSignals, defaultCam1Behavior, percentCamera1);
	 Camera camera2  (cam2Standby, cam2Film, pauseBuffer2, emptyBuffer2, displayCam2, cam2OutSignals, resetUI, clock, downloadInputUI, cam1OutSignals, defaultCam2Behavior, percentCamera2);
endmodule

module ClockDivider (clock, divided_clocks);
	 input clock;
	 output [31:0] divided_clocks;
	 reg [31:0] divided_clocks;

	 initial
	 divided_clocks = 0;

	 always @(posedge clock)
	 divided_clocks = divided_clocks + 1;
endmodule 

//-----------------------------------------------------------
// Module name:
// DE1_SoC_testbench
//
// Description:
// Module implemented as part of testing system.
// Tests all possible states of DE1_SoC_testbench.
// 
// Author(s):
// Cody Ohlsen
//
//----------------------------------------------------------- 
//module DE1_SoC_testbench ();
//	 reg        clock;
//	 wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
//	 wire [9:0] LEDR; 
//	 reg [3:0] KEY; 
//	 reg [9:0] SW; 
//	 
//	 reg rst;
//	 reg spacecraftArriving;
//	 reg spacecraftDeparting;
//	 reg outerPort	;
//	 reg innerPort ;
//	 reg pressurizeChamber;
//	 reg evacuateChamber;
//	 
//	 
//	assign KEY[0] = ~rst;
//	assign SW[0] = spacecraftArriving;
//	assign SW[1] = spacecraftDeparting;
//	assign SW[2] = outerPort;
//	assign SW[3] = innerPort;
//	assign KEY[1] = ~pressurizeChamber;
//	assign KEY[2] = ~evacuateChamber;
//	
//	reg helper;
//	parameter oneSec = 390625;
//	
//	parameter clkDur = 100;
//	
//	
//	// Set up the clock. 
//	initial clock=0;
//	initial helper = 0;
//	always begin 
//		#(clkDur/2); 
//		clock = ~clock; 
//	end
//	
//	always begin
//		#((clkDur * oneSec) / 2)
//		helper = ~helper;
//	end
//	initial rst = 0;
//	
//	DE1_SoC  dut (clock, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW); 
//	
//	initial begin
//			pressurizeChamber = 0;
//			evacuateChamber = 0;
//			outerPort = 0;
//			innerPort = 0;
//			spacecraftArriving = 0;
//			spacecraftDeparting = 0;
//			
//			//arriving
//												@(posedge helper);
//			rst = 0;							@(posedge helper);
//												@(posedge helper);
//		 	rst = 1;							@(posedge helper);
//		 	rst = 0;							@(posedge helper);
//			rst = 0;							@(posedge helper);
//												@(posedge helper);
//		 	rst = 1;							@(posedge helper);
//		 	rst = 0;							@(posedge helper);
//												@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//			spacecraftArriving = 1;				@(posedge helper);
//												@(posedge helper);
//			spacecraftArriving = 0;				@(posedge helper);
//												@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			evacuateChamber = 1;      			@(posedge helper);
//			evacuateChamber = 0;      			@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												
//			// departing now
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//			spacecraftDeparting = 1;			@(posedge helper);
//												@(posedge helper);
//			spacecraftDeparting = 0;			@(posedge helper);
//												@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			evacuateChamber = 1;       			@(posedge helper);
//			evacuateChamber = 0;       			@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//		 	rst = 1;							@(posedge helper);
//		 	rst = 0;							@(posedge helper);
//												@(posedge helper);
//												
//			//testing invalid inputs before arrive/depart signal
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			rst = 1;							@(posedge helper);
//		 	rst = 0;							@(posedge helper);
//			
//			//testing invalid/valid inputs at all stages in arrive
//												@(posedge helper);
//			spacecraftArriving = 1;				@(posedge helper);
//												@(posedge helper);
//			spacecraftArriving = 0;				@(posedge helper);
//												@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			//testing wrong inputs
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			evacuateChamber = 1;       			@(posedge helper);
//			evacuateChamber = 0;       			@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			//testing wrong inputs
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			//testing wrong inputs
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//			rst = 1;							@(posedge helper);
//		 	rst = 0;							@(posedge helper);
//			
//			
//			
//			//testing invalid/valid inputs at all stages in depart
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//			//testing invalid inputs before arrive/depart signal
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//			spacecraftDeparting = 1;			@(posedge helper);
//												@(posedge helper);
//			spacecraftDeparting = 0;			@(posedge helper);
//												@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			//testing invalid inputs before arrive/depart signal
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			evacuateChamber = 1;       			@(posedge helper);
//			evacuateChamber = 0;       			@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			//testing invalid inputs before arrive/depart signal
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			//testing invalid inputs before arrive/depart signal
//			evacuateChamber = 1;				@(posedge helper);
//			evacuateChamber = 0;				@(posedge helper);
//			outerPort = 1;						@(posedge helper);
//			outerPort = 0;						@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//			pressurizeChamber = 1;				@(posedge helper);
//			pressurizeChamber = 0;				@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//												@(posedge helper);
//			innerPort = 1;						@(posedge helper);
//			innerPort = 0;						@(posedge helper);
//												@(posedge helper);
//		 	rst = 1;							@(posedge helper);
//		 	rst = 0;							@(posedge helper);
//												@(posedge helper);
//		
//		$stop; // End the simulation.
//	end
//endmodule
