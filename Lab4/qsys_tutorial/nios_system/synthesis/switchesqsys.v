// switchesqsys.v

// Generated using ACDS version 14.0 200 at 2015.05.19.16:42:54

`timescale 1 ps / 1 ps
module switchesqsys (
		input  wire       clk_clk,                 //              clk.clk
		input  wire       reset_reset_n,           //            reset.reset_n
		input  wire [7:0] switches_export,         //         switches.export
		output wire [7:0] leds_export,             //             leds.export
		input  wire       readytodownload1_export, // readytodownload1.export
		output wire [1:0] outsignal_export,        //        outsignal.export
		input  wire [7:0] curbyte1_export,         //         curbyte1.export
		input  wire       readytodownload2_export, // readytodownload2.export
		input  wire [7:0] curbyte2_export          //         curbyte2.export
	);

	wire         nios2_processor_instruction_master_waitrequest;                  // mm_interconnect_0:nios2_processor_instruction_master_waitrequest -> nios2_processor:i_waitrequest
	wire  [13:0] nios2_processor_instruction_master_address;                      // nios2_processor:i_address -> mm_interconnect_0:nios2_processor_instruction_master_address
	wire         nios2_processor_instruction_master_read;                         // nios2_processor:i_read -> mm_interconnect_0:nios2_processor_instruction_master_read
	wire  [31:0] nios2_processor_instruction_master_readdata;                     // mm_interconnect_0:nios2_processor_instruction_master_readdata -> nios2_processor:i_readdata
	wire         nios2_processor_data_master_waitrequest;                         // mm_interconnect_0:nios2_processor_data_master_waitrequest -> nios2_processor:d_waitrequest
	wire  [31:0] nios2_processor_data_master_writedata;                           // nios2_processor:d_writedata -> mm_interconnect_0:nios2_processor_data_master_writedata
	wire  [13:0] nios2_processor_data_master_address;                             // nios2_processor:d_address -> mm_interconnect_0:nios2_processor_data_master_address
	wire         nios2_processor_data_master_write;                               // nios2_processor:d_write -> mm_interconnect_0:nios2_processor_data_master_write
	wire         nios2_processor_data_master_read;                                // nios2_processor:d_read -> mm_interconnect_0:nios2_processor_data_master_read
	wire  [31:0] nios2_processor_data_master_readdata;                            // mm_interconnect_0:nios2_processor_data_master_readdata -> nios2_processor:d_readdata
	wire         nios2_processor_data_master_debugaccess;                         // nios2_processor:jtag_debug_module_debugaccess_to_roms -> mm_interconnect_0:nios2_processor_data_master_debugaccess
	wire   [3:0] nios2_processor_data_master_byteenable;                          // nios2_processor:d_byteenable -> mm_interconnect_0:nios2_processor_data_master_byteenable
	wire         mm_interconnect_0_nios2_processor_jtag_debug_module_waitrequest; // nios2_processor:jtag_debug_module_waitrequest -> mm_interconnect_0:nios2_processor_jtag_debug_module_waitrequest
	wire  [31:0] mm_interconnect_0_nios2_processor_jtag_debug_module_writedata;   // mm_interconnect_0:nios2_processor_jtag_debug_module_writedata -> nios2_processor:jtag_debug_module_writedata
	wire   [8:0] mm_interconnect_0_nios2_processor_jtag_debug_module_address;     // mm_interconnect_0:nios2_processor_jtag_debug_module_address -> nios2_processor:jtag_debug_module_address
	wire         mm_interconnect_0_nios2_processor_jtag_debug_module_write;       // mm_interconnect_0:nios2_processor_jtag_debug_module_write -> nios2_processor:jtag_debug_module_write
	wire         mm_interconnect_0_nios2_processor_jtag_debug_module_read;        // mm_interconnect_0:nios2_processor_jtag_debug_module_read -> nios2_processor:jtag_debug_module_read
	wire  [31:0] mm_interconnect_0_nios2_processor_jtag_debug_module_readdata;    // nios2_processor:jtag_debug_module_readdata -> mm_interconnect_0:nios2_processor_jtag_debug_module_readdata
	wire         mm_interconnect_0_nios2_processor_jtag_debug_module_debugaccess; // mm_interconnect_0:nios2_processor_jtag_debug_module_debugaccess -> nios2_processor:jtag_debug_module_debugaccess
	wire   [3:0] mm_interconnect_0_nios2_processor_jtag_debug_module_byteenable;  // mm_interconnect_0:nios2_processor_jtag_debug_module_byteenable -> nios2_processor:jtag_debug_module_byteenable
	wire  [31:0] mm_interconnect_0_onchip_memory_s1_writedata;                    // mm_interconnect_0:onchip_memory_s1_writedata -> onchip_memory:writedata
	wire   [9:0] mm_interconnect_0_onchip_memory_s1_address;                      // mm_interconnect_0:onchip_memory_s1_address -> onchip_memory:address
	wire         mm_interconnect_0_onchip_memory_s1_chipselect;                   // mm_interconnect_0:onchip_memory_s1_chipselect -> onchip_memory:chipselect
	wire         mm_interconnect_0_onchip_memory_s1_clken;                        // mm_interconnect_0:onchip_memory_s1_clken -> onchip_memory:clken
	wire         mm_interconnect_0_onchip_memory_s1_write;                        // mm_interconnect_0:onchip_memory_s1_write -> onchip_memory:write
	wire  [31:0] mm_interconnect_0_onchip_memory_s1_readdata;                     // onchip_memory:readdata -> mm_interconnect_0:onchip_memory_s1_readdata
	wire   [3:0] mm_interconnect_0_onchip_memory_s1_byteenable;                   // mm_interconnect_0:onchip_memory_s1_byteenable -> onchip_memory:byteenable
	wire  [31:0] mm_interconnect_0_leds_s1_writedata;                             // mm_interconnect_0:LEDs_s1_writedata -> LEDs:writedata
	wire   [1:0] mm_interconnect_0_leds_s1_address;                               // mm_interconnect_0:LEDs_s1_address -> LEDs:address
	wire         mm_interconnect_0_leds_s1_chipselect;                            // mm_interconnect_0:LEDs_s1_chipselect -> LEDs:chipselect
	wire         mm_interconnect_0_leds_s1_write;                                 // mm_interconnect_0:LEDs_s1_write -> LEDs:write_n
	wire  [31:0] mm_interconnect_0_leds_s1_readdata;                              // LEDs:readdata -> mm_interconnect_0:LEDs_s1_readdata
	wire   [1:0] mm_interconnect_0_switches_s1_address;                           // mm_interconnect_0:switches_s1_address -> switches:address
	wire  [31:0] mm_interconnect_0_switches_s1_readdata;                          // switches:readdata -> mm_interconnect_0:switches_s1_readdata
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest;       // jtag_uart:av_waitrequest -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_waitrequest
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;         // mm_interconnect_0:jtag_uart_avalon_jtag_slave_writedata -> jtag_uart:av_writedata
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;           // mm_interconnect_0:jtag_uart_avalon_jtag_slave_address -> jtag_uart:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;        // mm_interconnect_0:jtag_uart_avalon_jtag_slave_chipselect -> jtag_uart:av_chipselect
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;             // mm_interconnect_0:jtag_uart_avalon_jtag_slave_write -> jtag_uart:av_write_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;              // mm_interconnect_0:jtag_uart_avalon_jtag_slave_read -> jtag_uart:av_read_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;          // jtag_uart:av_readdata -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_readdata
	wire   [1:0] mm_interconnect_0_readytodownload1_s1_address;                   // mm_interconnect_0:readyToDownload1_s1_address -> readyToDownload1:address
	wire  [31:0] mm_interconnect_0_readytodownload1_s1_readdata;                  // readyToDownload1:readdata -> mm_interconnect_0:readyToDownload1_s1_readdata
	wire  [31:0] mm_interconnect_0_outsignal_s1_writedata;                        // mm_interconnect_0:outSignal_s1_writedata -> outSignal:writedata
	wire   [1:0] mm_interconnect_0_outsignal_s1_address;                          // mm_interconnect_0:outSignal_s1_address -> outSignal:address
	wire         mm_interconnect_0_outsignal_s1_chipselect;                       // mm_interconnect_0:outSignal_s1_chipselect -> outSignal:chipselect
	wire         mm_interconnect_0_outsignal_s1_write;                            // mm_interconnect_0:outSignal_s1_write -> outSignal:write_n
	wire  [31:0] mm_interconnect_0_outsignal_s1_readdata;                         // outSignal:readdata -> mm_interconnect_0:outSignal_s1_readdata
	wire   [1:0] mm_interconnect_0_curbyte1_s1_address;                           // mm_interconnect_0:curByte1_s1_address -> curByte1:address
	wire  [31:0] mm_interconnect_0_curbyte1_s1_readdata;                          // curByte1:readdata -> mm_interconnect_0:curByte1_s1_readdata
	wire   [1:0] mm_interconnect_0_readytodownload2_s1_address;                   // mm_interconnect_0:readyToDownload2_s1_address -> readyToDownload2:address
	wire  [31:0] mm_interconnect_0_readytodownload2_s1_readdata;                  // readyToDownload2:readdata -> mm_interconnect_0:readyToDownload2_s1_readdata
	wire   [1:0] mm_interconnect_0_curbyte2_s1_address;                           // mm_interconnect_0:curByte2_s1_address -> curByte2:address
	wire  [31:0] mm_interconnect_0_curbyte2_s1_readdata;                          // curByte2:readdata -> mm_interconnect_0:curByte2_s1_readdata
	wire         irq_mapper_receiver0_irq;                                        // jtag_uart:av_irq -> irq_mapper:receiver0_irq
	wire  [31:0] nios2_processor_d_irq_irq;                                       // irq_mapper:sender_irq -> nios2_processor:d_irq
	wire         rst_controller_reset_out_reset;                                  // rst_controller:reset_out -> [LEDs:reset_n, curByte1:reset_n, curByte2:reset_n, irq_mapper:reset, jtag_uart:rst_n, mm_interconnect_0:nios2_processor_reset_n_reset_bridge_in_reset_reset, nios2_processor:reset_n, onchip_memory:reset, outSignal:reset_n, readyToDownload1:reset_n, readyToDownload2:reset_n, rst_translator:in_reset, switches:reset_n]
	wire         rst_controller_reset_out_reset_req;                              // rst_controller:reset_req -> [nios2_processor:reset_req, onchip_memory:reset_req, rst_translator:reset_req_in]
	wire         nios2_processor_jtag_debug_module_reset_reset;                   // nios2_processor:jtag_debug_module_resetrequest -> rst_controller:reset_in1

	switchesqsys_nios2_processor nios2_processor (
		.clk                                   (clk_clk),                                                         //                       clk.clk
		.reset_n                               (~rst_controller_reset_out_reset),                                 //                   reset_n.reset_n
		.reset_req                             (rst_controller_reset_out_reset_req),                              //                          .reset_req
		.d_address                             (nios2_processor_data_master_address),                             //               data_master.address
		.d_byteenable                          (nios2_processor_data_master_byteenable),                          //                          .byteenable
		.d_read                                (nios2_processor_data_master_read),                                //                          .read
		.d_readdata                            (nios2_processor_data_master_readdata),                            //                          .readdata
		.d_waitrequest                         (nios2_processor_data_master_waitrequest),                         //                          .waitrequest
		.d_write                               (nios2_processor_data_master_write),                               //                          .write
		.d_writedata                           (nios2_processor_data_master_writedata),                           //                          .writedata
		.jtag_debug_module_debugaccess_to_roms (nios2_processor_data_master_debugaccess),                         //                          .debugaccess
		.i_address                             (nios2_processor_instruction_master_address),                      //        instruction_master.address
		.i_read                                (nios2_processor_instruction_master_read),                         //                          .read
		.i_readdata                            (nios2_processor_instruction_master_readdata),                     //                          .readdata
		.i_waitrequest                         (nios2_processor_instruction_master_waitrequest),                  //                          .waitrequest
		.d_irq                                 (nios2_processor_d_irq_irq),                                       //                     d_irq.irq
		.jtag_debug_module_resetrequest        (nios2_processor_jtag_debug_module_reset_reset),                   //   jtag_debug_module_reset.reset
		.jtag_debug_module_address             (mm_interconnect_0_nios2_processor_jtag_debug_module_address),     //         jtag_debug_module.address
		.jtag_debug_module_byteenable          (mm_interconnect_0_nios2_processor_jtag_debug_module_byteenable),  //                          .byteenable
		.jtag_debug_module_debugaccess         (mm_interconnect_0_nios2_processor_jtag_debug_module_debugaccess), //                          .debugaccess
		.jtag_debug_module_read                (mm_interconnect_0_nios2_processor_jtag_debug_module_read),        //                          .read
		.jtag_debug_module_readdata            (mm_interconnect_0_nios2_processor_jtag_debug_module_readdata),    //                          .readdata
		.jtag_debug_module_waitrequest         (mm_interconnect_0_nios2_processor_jtag_debug_module_waitrequest), //                          .waitrequest
		.jtag_debug_module_write               (mm_interconnect_0_nios2_processor_jtag_debug_module_write),       //                          .write
		.jtag_debug_module_writedata           (mm_interconnect_0_nios2_processor_jtag_debug_module_writedata),   //                          .writedata
		.no_ci_readra                          ()                                                                 // custom_instruction_master.readra
	);

	switchesqsys_onchip_memory onchip_memory (
		.clk        (clk_clk),                                       //   clk1.clk
		.address    (mm_interconnect_0_onchip_memory_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_memory_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_memory_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_memory_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_memory_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_memory_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchip_memory_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),                // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req)             //       .reset_req
	);

	switchesqsys_switches switches (
		.clk      (clk_clk),                                //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),        //               reset.reset_n
		.address  (mm_interconnect_0_switches_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_switches_s1_readdata), //                    .readdata
		.in_port  (switches_export)                         // external_connection.export
	);

	switchesqsys_LEDs leds (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_leds_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_leds_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_leds_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_leds_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_leds_s1_readdata),   //                    .readdata
		.out_port   (leds_export)                           // external_connection.export
	);

	switchesqsys_jtag_uart jtag_uart (
		.clk            (clk_clk),                                                   //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                           //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                                   //               irq.irq
	);

	switchesqsys_readyToDownload1 readytodownload1 (
		.clk      (clk_clk),                                        //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                //               reset.reset_n
		.address  (mm_interconnect_0_readytodownload1_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_readytodownload1_s1_readdata), //                    .readdata
		.in_port  (readytodownload1_export)                         // external_connection.export
	);

	switchesqsys_outSignal outsignal (
		.clk        (clk_clk),                                   //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),           //               reset.reset_n
		.address    (mm_interconnect_0_outsignal_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_outsignal_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_outsignal_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_outsignal_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_outsignal_s1_readdata),   //                    .readdata
		.out_port   (outsignal_export)                           // external_connection.export
	);

	switchesqsys_switches curbyte1 (
		.clk      (clk_clk),                                //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),        //               reset.reset_n
		.address  (mm_interconnect_0_curbyte1_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_curbyte1_s1_readdata), //                    .readdata
		.in_port  (curbyte1_export)                         // external_connection.export
	);

	switchesqsys_readyToDownload1 readytodownload2 (
		.clk      (clk_clk),                                        //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                //               reset.reset_n
		.address  (mm_interconnect_0_readytodownload2_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_readytodownload2_s1_readdata), //                    .readdata
		.in_port  (readytodownload2_export)                         // external_connection.export
	);

	switchesqsys_switches curbyte2 (
		.clk      (clk_clk),                                //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),        //               reset.reset_n
		.address  (mm_interconnect_0_curbyte2_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_curbyte2_s1_readdata), //                    .readdata
		.in_port  (curbyte2_export)                         // external_connection.export
	);

	switchesqsys_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                       (clk_clk),                                                         //                                     clk_0_clk.clk
		.nios2_processor_reset_n_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                                  // nios2_processor_reset_n_reset_bridge_in_reset.reset
		.nios2_processor_data_master_address                 (nios2_processor_data_master_address),                             //                   nios2_processor_data_master.address
		.nios2_processor_data_master_waitrequest             (nios2_processor_data_master_waitrequest),                         //                                              .waitrequest
		.nios2_processor_data_master_byteenable              (nios2_processor_data_master_byteenable),                          //                                              .byteenable
		.nios2_processor_data_master_read                    (nios2_processor_data_master_read),                                //                                              .read
		.nios2_processor_data_master_readdata                (nios2_processor_data_master_readdata),                            //                                              .readdata
		.nios2_processor_data_master_write                   (nios2_processor_data_master_write),                               //                                              .write
		.nios2_processor_data_master_writedata               (nios2_processor_data_master_writedata),                           //                                              .writedata
		.nios2_processor_data_master_debugaccess             (nios2_processor_data_master_debugaccess),                         //                                              .debugaccess
		.nios2_processor_instruction_master_address          (nios2_processor_instruction_master_address),                      //            nios2_processor_instruction_master.address
		.nios2_processor_instruction_master_waitrequest      (nios2_processor_instruction_master_waitrequest),                  //                                              .waitrequest
		.nios2_processor_instruction_master_read             (nios2_processor_instruction_master_read),                         //                                              .read
		.nios2_processor_instruction_master_readdata         (nios2_processor_instruction_master_readdata),                     //                                              .readdata
		.curByte1_s1_address                                 (mm_interconnect_0_curbyte1_s1_address),                           //                                   curByte1_s1.address
		.curByte1_s1_readdata                                (mm_interconnect_0_curbyte1_s1_readdata),                          //                                              .readdata
		.curByte2_s1_address                                 (mm_interconnect_0_curbyte2_s1_address),                           //                                   curByte2_s1.address
		.curByte2_s1_readdata                                (mm_interconnect_0_curbyte2_s1_readdata),                          //                                              .readdata
		.jtag_uart_avalon_jtag_slave_address                 (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),           //                   jtag_uart_avalon_jtag_slave.address
		.jtag_uart_avalon_jtag_slave_write                   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),             //                                              .write
		.jtag_uart_avalon_jtag_slave_read                    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),              //                                              .read
		.jtag_uart_avalon_jtag_slave_readdata                (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),          //                                              .readdata
		.jtag_uart_avalon_jtag_slave_writedata               (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),         //                                              .writedata
		.jtag_uart_avalon_jtag_slave_waitrequest             (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest),       //                                              .waitrequest
		.jtag_uart_avalon_jtag_slave_chipselect              (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),        //                                              .chipselect
		.LEDs_s1_address                                     (mm_interconnect_0_leds_s1_address),                               //                                       LEDs_s1.address
		.LEDs_s1_write                                       (mm_interconnect_0_leds_s1_write),                                 //                                              .write
		.LEDs_s1_readdata                                    (mm_interconnect_0_leds_s1_readdata),                              //                                              .readdata
		.LEDs_s1_writedata                                   (mm_interconnect_0_leds_s1_writedata),                             //                                              .writedata
		.LEDs_s1_chipselect                                  (mm_interconnect_0_leds_s1_chipselect),                            //                                              .chipselect
		.nios2_processor_jtag_debug_module_address           (mm_interconnect_0_nios2_processor_jtag_debug_module_address),     //             nios2_processor_jtag_debug_module.address
		.nios2_processor_jtag_debug_module_write             (mm_interconnect_0_nios2_processor_jtag_debug_module_write),       //                                              .write
		.nios2_processor_jtag_debug_module_read              (mm_interconnect_0_nios2_processor_jtag_debug_module_read),        //                                              .read
		.nios2_processor_jtag_debug_module_readdata          (mm_interconnect_0_nios2_processor_jtag_debug_module_readdata),    //                                              .readdata
		.nios2_processor_jtag_debug_module_writedata         (mm_interconnect_0_nios2_processor_jtag_debug_module_writedata),   //                                              .writedata
		.nios2_processor_jtag_debug_module_byteenable        (mm_interconnect_0_nios2_processor_jtag_debug_module_byteenable),  //                                              .byteenable
		.nios2_processor_jtag_debug_module_waitrequest       (mm_interconnect_0_nios2_processor_jtag_debug_module_waitrequest), //                                              .waitrequest
		.nios2_processor_jtag_debug_module_debugaccess       (mm_interconnect_0_nios2_processor_jtag_debug_module_debugaccess), //                                              .debugaccess
		.onchip_memory_s1_address                            (mm_interconnect_0_onchip_memory_s1_address),                      //                              onchip_memory_s1.address
		.onchip_memory_s1_write                              (mm_interconnect_0_onchip_memory_s1_write),                        //                                              .write
		.onchip_memory_s1_readdata                           (mm_interconnect_0_onchip_memory_s1_readdata),                     //                                              .readdata
		.onchip_memory_s1_writedata                          (mm_interconnect_0_onchip_memory_s1_writedata),                    //                                              .writedata
		.onchip_memory_s1_byteenable                         (mm_interconnect_0_onchip_memory_s1_byteenable),                   //                                              .byteenable
		.onchip_memory_s1_chipselect                         (mm_interconnect_0_onchip_memory_s1_chipselect),                   //                                              .chipselect
		.onchip_memory_s1_clken                              (mm_interconnect_0_onchip_memory_s1_clken),                        //                                              .clken
		.outSignal_s1_address                                (mm_interconnect_0_outsignal_s1_address),                          //                                  outSignal_s1.address
		.outSignal_s1_write                                  (mm_interconnect_0_outsignal_s1_write),                            //                                              .write
		.outSignal_s1_readdata                               (mm_interconnect_0_outsignal_s1_readdata),                         //                                              .readdata
		.outSignal_s1_writedata                              (mm_interconnect_0_outsignal_s1_writedata),                        //                                              .writedata
		.outSignal_s1_chipselect                             (mm_interconnect_0_outsignal_s1_chipselect),                       //                                              .chipselect
		.readyToDownload1_s1_address                         (mm_interconnect_0_readytodownload1_s1_address),                   //                           readyToDownload1_s1.address
		.readyToDownload1_s1_readdata                        (mm_interconnect_0_readytodownload1_s1_readdata),                  //                                              .readdata
		.readyToDownload2_s1_address                         (mm_interconnect_0_readytodownload2_s1_address),                   //                           readyToDownload2_s1.address
		.readyToDownload2_s1_readdata                        (mm_interconnect_0_readytodownload2_s1_readdata),                  //                                              .readdata
		.switches_s1_address                                 (mm_interconnect_0_switches_s1_address),                           //                                   switches_s1.address
		.switches_s1_readdata                                (mm_interconnect_0_switches_s1_readdata)                           //                                              .readdata
	);

	switchesqsys_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.sender_irq    (nios2_processor_d_irq_irq)       //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                                // reset_in0.reset
		.reset_in1      (nios2_processor_jtag_debug_module_reset_reset), // reset_in1.reset
		.clk            (clk_clk),                                       //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),                // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req),            //          .reset_req
		.reset_req_in0  (1'b0),                                          // (terminated)
		.reset_req_in1  (1'b0),                                          // (terminated)
		.reset_in2      (1'b0),                                          // (terminated)
		.reset_req_in2  (1'b0),                                          // (terminated)
		.reset_in3      (1'b0),                                          // (terminated)
		.reset_req_in3  (1'b0),                                          // (terminated)
		.reset_in4      (1'b0),                                          // (terminated)
		.reset_req_in4  (1'b0),                                          // (terminated)
		.reset_in5      (1'b0),                                          // (terminated)
		.reset_req_in5  (1'b0),                                          // (terminated)
		.reset_in6      (1'b0),                                          // (terminated)
		.reset_req_in6  (1'b0),                                          // (terminated)
		.reset_in7      (1'b0),                                          // (terminated)
		.reset_req_in7  (1'b0),                                          // (terminated)
		.reset_in8      (1'b0),                                          // (terminated)
		.reset_req_in8  (1'b0),                                          // (terminated)
		.reset_in9      (1'b0),                                          // (terminated)
		.reset_req_in9  (1'b0),                                          // (terminated)
		.reset_in10     (1'b0),                                          // (terminated)
		.reset_req_in10 (1'b0),                                          // (terminated)
		.reset_in11     (1'b0),                                          // (terminated)
		.reset_req_in11 (1'b0),                                          // (terminated)
		.reset_in12     (1'b0),                                          // (terminated)
		.reset_req_in12 (1'b0),                                          // (terminated)
		.reset_in13     (1'b0),                                          // (terminated)
		.reset_req_in13 (1'b0),                                          // (terminated)
		.reset_in14     (1'b0),                                          // (terminated)
		.reset_req_in14 (1'b0),                                          // (terminated)
		.reset_in15     (1'b0),                                          // (terminated)
		.reset_req_in15 (1'b0)                                           // (terminated)
	);

endmodule
