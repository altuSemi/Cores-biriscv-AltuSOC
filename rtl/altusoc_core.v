// SPDX-License-Identifier: Apache-2.0
// Copyright 2019-2020 Western Digital Corporation or its affiliates.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//********************************************************************************
// $Id$
//
// Function: SweRVolf tech-agnostic toplevel
// Comments:
//
//********************************************************************************

`default_nettype none

module altusoc_core
   (input wire 	clk,
    input wire 	       rstn,
    input wire [7:0]  i_gpio,
    output wire [7:0] o_gpio);



   localparam BOOTROM_SIZE = 32'h1000;

   wire        rst_n = rstn;

   wire [31:0] nmi_vec;

`include "axi_intercon.vh"
assign host_arid 	= 'b010;
assign host_araddr 	= 'b0;
assign host_arlen 	= 'b0;
assign host_arsize 	= 'b0;
assign host_arburst 	= 'b0;
assign host_arlock 	= 'b0;
assign host_arcache 	= 'b0;
assign host_arprot 	= 'b0;
assign host_arregion 	= 'b0;
assign host_arqos 	= 'b0;
assign host_arvalid 	= 'b0;

assign host_rready 	= 'b0;

assign host_bready 	= 'b0;

assign host_awid 	= 'b011;
assign host_awaddr 	= 'b0;
assign host_awlen 	= 'b0;
assign host_awsize	= 'b0;
assign host_awburst 	= 'b0;
assign host_awlock 	= 'b0;
assign host_awcache 	= 'b0;
assign host_awprot 	= 'b0;
assign host_awregion	= 'b0;
assign host_awqos 	= 'b0;
assign host_awvalid	= 'b0;

assign host_wvalid	= 'b0;
assign host_wlast	= 'b0;
assign host_wstrb	= 'b0;
assign host_wdata	= 'b0;



   wire 		      wb_clk = clk;
   wire 		      wb_rst = ~rst_n;

`include "wb_intercon.vh"

   wire [15:2] 		       wb_adr;

   assign		       wb_m2s_io_adr = {16'd0,wb_adr,2'b00};
   assign wb_m2s_io_cti = 3'b000;
   assign wb_m2s_io_bte = 2'b00;

   axi2wb
     #(.AW (16),
       .IW (4))
   axi2wb
     (
      .i_clk       (clk),
      .i_rst       (~rst_n),
      .o_wb_adr    (wb_adr),
      .o_wb_dat    (wb_m2s_io_dat),
      .o_wb_sel    (wb_m2s_io_sel),
      .o_wb_we     (wb_m2s_io_we),
      .o_wb_cyc    (wb_m2s_io_cyc),
      .o_wb_stb    (wb_m2s_io_stb),
      .i_wb_rdt    (wb_s2m_io_dat),
      .i_wb_ack    (wb_s2m_io_ack),
      .i_wb_err    (wb_s2m_io_err),

      .i_awaddr    (io_awaddr[15:0]),
      .i_awid      (io_awid),
      .i_awvalid   (io_awvalid),
      .o_awready   (io_awready),

      .i_araddr    (io_araddr[15:0]),
      .i_arid      (io_arid),
      .i_arvalid   (io_arvalid),
      .o_arready   (io_arready),

      .i_wdata     (io_wdata),
      .i_wstrb     (io_wstrb),
      .i_wvalid    (io_wvalid),
      .o_wready    (io_wready),

      .o_bid       (io_bid),
      .o_bresp     (io_bresp),
      .o_bvalid    (io_bvalid),
      .i_bready    (io_bready),

      .o_rdata     (io_rdata),
      .o_rid       (io_rid),
      .o_rresp     (io_rresp),
      .o_rlast     (io_rlast),
      .o_rvalid    (io_rvalid),
      .i_rready    (io_rready));
wire [27:0] nc1,nc2;
wire [27:0] d0='b0;

   altusoc_syscon syscon
     (.i_clk            (clk),
      .i_rst            (wb_rst),

      .i_gpio           ({d0,i_gpio[7:4],d0,i_gpio[3:0]}),
      .o_gpio           ({nc1,o_gpio[7:4],nc2,o_gpio[3:0]}),
      .o_nmi_vec        (nmi_vec),

      .i_wb_adr         (wb_m2s_sys_adr[5:0]),
      .i_wb_dat         (wb_m2s_sys_dat),
      .i_wb_sel         (wb_m2s_sys_sel),
      .i_wb_we          (wb_m2s_sys_we),
      .i_wb_cyc         (wb_m2s_sys_cyc),
      .i_wb_stb         (wb_m2s_sys_stb),
      .o_wb_rdt         (wb_s2m_sys_dat),
      .o_wb_ack         (wb_s2m_sys_ack));

   assign wb_s2m_sys_err = 1'b0;
   assign wb_s2m_sys_rty = 1'b0;

   assign wb_s2m_unused_err = 1'b0;
   assign wb_s2m_unused_rty = 1'b0;
   assign wb_s2m_unused_dat = 'b0;
   assign wb_s2m_unused_ack = 1'b0;



riscv_tcm_top u_riscv_tcm_top
     (
    .clk(clk),
    .rst(~rstn),
    .rst_cpu(~rstn),
    .intr(nmi_vec),

    //AXI Master + Slave interfaces
    .*
);


endmodule
