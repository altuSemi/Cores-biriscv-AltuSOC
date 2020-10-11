//!********************************************************************************
//! $Id$
//!
//! Function: Biricv core filelist
//! Modifications copyright (C) 2020 altusemi
//! Comments:
//!********************************************************************************
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_defs.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_decode.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_decoder.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_csr.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_csr_regfile.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_alu.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_npc.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_multiplier.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_mmu.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_lsu.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_issue.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_frontend.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_fetch.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_exec.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_divider.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/riscv_core.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_xilinx_2r1w.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_trace_sim.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_regfile.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/core/biriscv_pipe_ctrl.v"

`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/top/riscv_top.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/top/riscv_tcm_top.v"

`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/tcm/tcm_mem.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/tcm/tcm_mem_ram.v"

`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/tcm/tcm_mem_pmem.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/tcm/dport_axi.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/tcm/tcm_mem_rom.v"
`include "/home/altus/Cores-biriscv-AltuSOC/rtl/biriscv/src/tcm/dport_mux.v"

