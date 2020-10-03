set PROJECT "altusoc"
set XILINX_PART "xc7z010clg400-1"
set XILINX_BOARD "digilentinc.com:zybo:part0:1.0"
set USER "altus"
set ALTUS_HOME "/home/${USER}/Cores-biriscv-AltuSOC"
set BUILD_HOME  "/home/${USER}/swervolf/build/altusoc_0.1/"
set CONSTRS_DIR "${ALTUS_HOME}/tools/"
set BOARD "zybo"


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


set_property verilog_define {VERSION_MAJOR=0 VERSION_MINOR=7 VERSION_PATCH=1 VERSION_REV=8 VERSION_DIRTY=1 VERSION_SHA=d5d82060 } [get_filesets sources_1]

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

set_property include_dirs [list ../src/pulp-platform.org__common_cells_1.16.4/include ../src/wb_common_1.0.3 ../src/pulp-platform.org__axi_0.23.0-r1/include ../src/altusoc-intercon_0.1 ../src/altusoc-wb_intercon_0.1 /home/altus/Cores-biriscv-AltuSOC/sw  .] [get_filesets sources_1]
set_property top altusoc_core [current_fileset]
set_property source_mgmt_mode None [current_project]


# Add constraints
#add_files -fileset constrs_1 -norecurse $CONSTRS_DIR/$BOARD.xdc

# Elaborate design
synth_design -rtl -name rtl_1 

# Launch synthesis
set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY none [get_runs synth_1]
#set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value -sfcu -objects [get_runs synth_1] ;# Use single file compilation unit mode to prevent issues with import pkg::* statements in the codebase
set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY full [get_runs synth_1]
#set_property STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE AreaOptimized_high [get_runs synth_1]
#launch_runs synth_1 -jobs $CPUS
#wait_on_run synth_1
#open_run synth_1 -name netlist_1
#set_property needs_refresh false [get_runs synth_1]


