transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib switchesqsys
vmap switchesqsys switchesqsys
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/switchesqsys.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_load.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_outSignal.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_readyToDownload.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_jtag_uart.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_LEDs.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_switches.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_onchip_memory.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_nios2_processor.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_nios2_processor_jtag_debug_module_sysclk.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_nios2_processor_jtag_debug_module_tck.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_nios2_processor_jtag_debug_module_wrapper.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_nios2_processor_oci_test_bench.v}
vlog -vlog01compat -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_nios2_processor_test_bench.v}
vlog -vlog01compat -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/lights.v}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_irq_mapper.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_rsp_mux_001.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_rsp_demux_002.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_cmd_mux_002.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_cmd_demux_001.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_router_004.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_router_002.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_router_001.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/switchesqsys_mm_interconnect_0_router.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work switchesqsys +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/nios_system/synthesis/submodules/altera_merlin_master_translator.sv}
vlog -sv -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/output_files {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/output_files/Camera.sv}
vlog -sv -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/CountUp.sv}
vlog -sv -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/DFlipFlop.sv}
vlog -sv -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/UserInput.sv}
vlog -sv -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/Percents.sv}
vlog -sv -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/streamCounter.sv}
vlog -sv -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/startBitDetect.sv}
vlog -sv -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/ReadInBuffer.sv}
vlog -sv -work work +incdir+C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5 {C:/Users/zachn/Documents/nightmares/ll11ll1lll1l1l_lab5/readOutBuffer.sv}

