exec rm -rf ./altusoc* ./vivado*
set PROJECT "altusoc"
set XILINX_PART "xc7z010clg400-1"
set XILINX_BOARD "digilentinc.com:zybo:part0:1.0"
set USER "altus"
set ALTUS_HOME "/home/${USER}/Cores-biriscv-AltuSOC"
set BUILD_HOME  "/home/${USER}/swervolf/build/altusoc_0.1"
set SCR_DIR "${ALTUS_HOME}/tools"
set BOARD "zybo"
set FUSESOC 0
set SYN_SIM 0
set IMP_SIM 0
set HW_DEBUG 1

# Set number of CPUs, default to 4 if system's getconf doesn't work
set CPUS [exec getconf _NPROCESSORS_ONLN]
if { ![info exists CPUS] } {
  set CPUS 4
}

start_gui

# create project
create_project $PROJECT . -force
set_property part  $XILINX_PART [current_project]
set_property board_part $XILINX_BOARD [current_project]


set_property verilog_define {VERILATOR} [current_fileset]



# read verilog files
if { $FUSESOC==1 } {
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/src/addr_decode.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/src/delta_counter.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/src/fifo_v3.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/src/rr_arb_tree.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/src/spill_register.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/src/counter.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/src/stream_register.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/src/deprecated/fifo_v2.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/include/axi/assign.svh
   set_property is_global_include true [get_files ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/include/axi/assign.svh] 
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/include/axi/typedef.svh
   set_property is_global_include true [get_files ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/include/axi/typedef.svh] 
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/include/common_cells/registers.svh
   set_property is_global_include true [get_files ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/include/common_cells/registers.svh]
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/src/axi_pkg.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/src/axi_atop_filter.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/src/axi_demux.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/src/axi_id_prepend.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/src/axi_mux.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/src/axi_err_slv.sv
   read_verilog -sv ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/src/axi_xbar.sv
   
   read_verilog ${BUILD_HOME}/src/wb_intercon_1.2.2-r1/rtl/verilog/wb_mux.v
   read_verilog -sv ${BUILD_HOME}/src/altusoc_0.1/rtl/dpram64.v
   read_verilog -sv ${BUILD_HOME}/src/altusoc_0.1/rtl/axi2wb.v
   read_verilog -sv ${BUILD_HOME}/src/altusoc_0.1/rtl/wb_mem_wrapper.v
   read_verilog -sv ${BUILD_HOME}/src/altusoc_0.1/rtl/altusoc_syscon.v
   read_verilog -sv ${BUILD_HOME}/src/altusoc-intercon_0.1/axi_intercon.v
   read_verilog ${BUILD_HOME}/src/altusoc-wb_intercon_0.1/wb_intercon.v
   
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_defs.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_decode.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_decoder.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_csr.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_csr_regfile.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_alu.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_npc.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_multiplier.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_mmu.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_lsu.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_issue.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_frontend.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_fetch.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_exec.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_divider.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/riscv_core.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_xilinx_2r1w.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_trace_sim.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_regfile.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_pipe_ctrl.v
   
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/tcm_mem_rom.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/tcm_mem_ram.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/tcm_mem_pmem.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/tcm_mem.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/dport_axi.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/dport_mux.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/top/riscv_tcm_top.v
   
   read_verilog -sv ${BUILD_HOME}/src/altusoc_0.1/rtl/altusoc_core.v
   read_verilog -sv ${BUILD_HOME}/src/altusoc_0.1/tb/altusoc_core_vivado_tb.v
   
   set_property include_dirs [list ${BUILD_HOME}/src/pulp-platform.org__common_cells_1.16.4/include ${BUILD_HOME}/src/pulp-platform.org__axi_0.23.0-r1/include ${BUILD_HOME}/src/altusoc-intercon_0.1 ${BUILD_HOME}/src/altusoc-wb_intercon_0.1 /home/altus/Cores-biriscv-AltuSOC/sw  .] [get_filesets sources_1]
} else {
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/addr_decode.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/delta_counter.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/fifo_v3.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/rr_arb_tree.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/spill_register.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/counter.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/stream_register.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/fifo_v2.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/include/axi/assign.svh
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/include/axi/typedef.svh
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/include/common_cells/registers.svh
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/axi_pkg.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/axi_atop_filter.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/axi_demux.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/axi_id_prepend.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/axi_mux.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/axi_err_slv.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/axi_xbar.sv
   read_verilog -sv ${ALTUS_HOME}/rtl/axi/axi_intercon.v
   
   read_verilog ${ALTUS_HOME}/rtl/wb/wb_mux.v
   read_verilog ${ALTUS_HOME}/rtl/wb/wb_intercon.v

   read_verilog -sv ${ALTUS_HOME}/rtl/dpram64.v
   read_verilog -sv ${ALTUS_HOME}/rtl/axi2wb.v
   read_verilog -sv ${ALTUS_HOME}/rtl/wb_mem_wrapper.v
   read_verilog -sv ${ALTUS_HOME}/rtl/altusoc_syscon.v
   
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_defs.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_decode.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_decoder.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_csr.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_csr_regfile.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_alu.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_npc.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_multiplier.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_mmu.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_lsu.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_issue.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_frontend.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_fetch.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_exec.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_divider.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/riscv_core.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_xilinx_2r1w.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_trace_sim.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_regfile.v
   read_verilog ${ALTUS_HOME}/rtl/biriscv/src/core/biriscv_pipe_ctrl.v
   
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/tcm_mem_rom.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/tcm_mem_ram.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/tcm_mem_pmem.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/tcm_mem.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/dport_axi.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/tcm/dport_mux.v
   add_files -norecurse -scan_for_includes ${ALTUS_HOME}/rtl/biriscv/src/top/riscv_tcm_top.v
   
   read_verilog -sv ${ALTUS_HOME}/rtl/altusoc_core.v
   read_verilog -sv ${ALTUS_HOME}/tb/altusoc_core_vivado_tb.v
   read_verilog -sv ${ALTUS_HOME}/tb/verilator_define.vh
   set_property is_global_include true [get_files ${ALTUS_HOME}/tb/verilator_define.vh]
   set_property is_global_include true [get_files ${ALTUS_HOME}/rtl/axi/include/axi/assign.svh] 
   set_property is_global_include true [get_files ${ALTUS_HOME}/rtl/axi/include/axi/typedef.svh] 
   set_property is_global_include true [get_files ${ALTUS_HOME}/rtl/axi/include/common_cells/registers.svh]

   set_property include_dirs [list ${ALTUS_HOME}/sw/ ${ALTUS_HOME}/rtl/axi/include/ ${ALTUS_HOME}/rtl/axi/include/axi/ ${ALTUS_HOME}/rtl/axi/include/axi/common_cells/  ${ALTUS_HOME}/rtl/wb/include/ ] [get_filesets sources_1]

   }

   
set_property top altusoc_core [current_fileset]
set_property top altusoc_core_vivado_tb [get_filesets sim_1]
set_property source_mgmt_mode None [current_project]


# Add constraints
add_files -fileset constrs_1 -norecurse $SCR_DIR/$BOARD.xdc
# clock wizard
create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name clk_wiz_0
set_property -dict [list CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50.000} CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.000} CONFIG.CLKOUT1_JITTER {151.636}] [get_ips clk_wiz_0]
generate_target {instantiation_template} [get_files  ./altusoc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]
generate_target all [get_files  ./altusoc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]
catch { config_ip_cache -export [get_ips -all clk_wiz_0] }
export_ip_user_files -of_objects [get_files  ./altusoc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] ./altusoc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]
launch_runs clk_wiz_0_synth_1 -jobs $CPUS
wait_on_run clk_wiz_0_synth_1

# Elaborate design
synth_design -rtl -name rtl_1 

# Launch synthesis
#set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value -sfcu -objects [get_runs synth_1] ;# Use single file compilation unit mode to prevent issues with import pkg::* statements in the codebase
set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY full [get_runs synth_1]
#set_property STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE AreaOptimized_high [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE PerformanceOptimized [get_runs synth_1]
set_property strategy Flow_PerfOptimized_high [get_runs synth_1]
launch_runs synth_1 -jobs $CPUS
wait_on_run synth_1
open_run synth_1 -name netlist_1
set_property needs_refresh false [get_runs synth_1]

#Synthesis SIM
if {$SYN_SIM==1} {
	set_property source_mgmt_mode All [current_project]
	update_compile_order -fileset sources_1
        add_files -fileset sim_1 -norecurse $SCR_DIR/altusoc_core_vivado_tb_time_synth.wcfg
        set_property xsim.view $SCR_DIR/altusoc_core_vivado_tb_time_synth.wcfg [get_filesets sim_1]
        open_wave_config {/home/altus/Projects/altusoc/altusoc.sim/sim_1/synth/timing/xsim/altusoc_core_vivado_tb_time_synth.wcfg}

	launch_simulation -mode post-synthesis -type timing
}

#Add Debug Core
if {$HW_DEBUG==1} {
	create_debug_core u_ila_0 ila
	set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
	set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
	set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
	set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
	set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
	set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
	set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
	set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
	connect_debug_port u_ila_0/clk [get_nets [list clk_wiz_0_inst/inst/clk_out1 ]]
	set_property port_width 32 [get_debug_ports u_ila_0/probe0]
	set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
	connect_debug_port u_ila_0/probe0 [get_nets [list {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[0]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[1]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[2]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[3]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[4]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[5]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[6]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[7]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[8]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[9]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[10]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[11]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[12]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[13]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[14]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[15]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[16]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[17]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[18]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[19]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[20]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[21]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[22]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[23]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[24]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[25]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[26]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[27]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[28]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[29]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[30]} {u_riscv_tcm_top/u_core/u_csrfile/csr_mcycle_q_reg[31]} ]]
	create_debug_port u_ila_0 probe
	set_property port_width 4 [get_debug_ports u_ila_0/probe1]
	set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
	connect_debug_port u_ila_0/probe1 [get_nets [list {o_gpio_OBUF[0]} {o_gpio_OBUF[1]} {o_gpio_OBUF[2]} {o_gpio_OBUF[3]} ]]
	create_debug_port u_ila_0 probe
	set_property port_width 32 [get_debug_ports u_ila_0/probe2]
	set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
	connect_debug_port u_ila_0/probe2 [get_nets [list {u_riscv_tcm_top/ifetch_pc_w[0]} {u_riscv_tcm_top/ifetch_pc_w[1]} {u_riscv_tcm_top/ifetch_pc_w[2]} {u_riscv_tcm_top/ifetch_pc_w[3]} {u_riscv_tcm_top/ifetch_pc_w[4]} {u_riscv_tcm_top/ifetch_pc_w[5]} {u_riscv_tcm_top/ifetch_pc_w[6]} {u_riscv_tcm_top/ifetch_pc_w[7]} {u_riscv_tcm_top/ifetch_pc_w[8]} {u_riscv_tcm_top/ifetch_pc_w[9]} {u_riscv_tcm_top/ifetch_pc_w[10]} {u_riscv_tcm_top/ifetch_pc_w[11]} {u_riscv_tcm_top/ifetch_pc_w[12]} {u_riscv_tcm_top/ifetch_pc_w[13]} {u_riscv_tcm_top/ifetch_pc_w[14]} {u_riscv_tcm_top/ifetch_pc_w[15]} {u_riscv_tcm_top/ifetch_pc_w[16]} {u_riscv_tcm_top/ifetch_pc_w[17]} {u_riscv_tcm_top/ifetch_pc_w[18]} {u_riscv_tcm_top/ifetch_pc_w[19]} {u_riscv_tcm_top/ifetch_pc_w[20]} {u_riscv_tcm_top/ifetch_pc_w[21]} {u_riscv_tcm_top/ifetch_pc_w[22]} {u_riscv_tcm_top/ifetch_pc_w[23]} {u_riscv_tcm_top/ifetch_pc_w[24]} {u_riscv_tcm_top/ifetch_pc_w[25]} {u_riscv_tcm_top/ifetch_pc_w[26]} {u_riscv_tcm_top/ifetch_pc_w[27]} {u_riscv_tcm_top/ifetch_pc_w[28]} {u_riscv_tcm_top/ifetch_pc_w[29]} {u_riscv_tcm_top/ifetch_pc_w[30]} {u_riscv_tcm_top/ifetch_pc_w[31]} ]]
	create_debug_port u_ila_0 probe
	set_property port_width 4 [get_debug_ports u_ila_0/probe3]
	set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
	connect_debug_port u_ila_0/probe3 [get_nets [list {i_gpio_IBUF[0]} {i_gpio_IBUF[1]} {i_gpio_IBUF[2]} {i_gpio_IBUF[3]} ]]
	create_debug_port u_ila_0 probe
	set_property port_width 1 [get_debug_ports u_ila_0/probe4]
	set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
	connect_debug_port u_ila_0/probe4 [get_nets [list riscv_mst_awvalid ]]
	create_debug_port u_ila_0 probe
	set_property port_width 1 [get_debug_ports u_ila_0/probe5]
	set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
	connect_debug_port u_ila_0/probe5 [get_nets [list riscv_mst_bvalid ]]
	create_debug_port u_ila_0 probe
	set_property port_width 1 [get_debug_ports u_ila_0/probe6]
	set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
	connect_debug_port u_ila_0/probe6 [get_nets [list riscv_mst_rvalid ]]
	create_debug_port u_ila_0 probe
	set_property port_width 1 [get_debug_ports u_ila_0/probe7]
	set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
	connect_debug_port u_ila_0/probe7 [get_nets [list riscv_mst_wvalid ]]
}

# Launch Implementation
set_property strategy Performance_NetDelay_low [get_runs impl_1]
set_property strategy Performance_Retiming [get_runs impl_1]
set_property STEPS.INIT_DESIGN.TCL.POST {} [get_runs impl_1]
launch_runs impl_1 -to_step write_bitstream -jobs $CPUS
wait_on_run impl_1
open_run impl_1 -name netlist_1
set_property needs_refresh false [get_runs impl_1]

# Implementation SIM
if {$IMP_SIM==1} {
	set_property source_mgmt_mode All [current_project]
	update_compile_order -fileset sources_1
        add_files -fileset sim_1 -norecurse $SCR_DIR/altusoc_core_vivado_tb_time_synth.wcfg
        set_property xsim.view $SCR_DIR/altusoc_core_vivado_tb_time_synth.wcfg [get_filesets sim_1]
        open_wave_config {/home/altus/Projects/altusoc/altusoc.sim/sim_1/synth/timing/xsim/altusoc_core_vivado_tb_time_synth.wcfg}

	launch_simulation -mode post-implementation -type timing
}
