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

//`default_nettype none

module altusoc_core #(
	parameter BOOTROM_FILE  = "bootrom.vh"
)
(
`ifdef SPI_IF
    input  logic                        spi_sclk,
    input  logic                        spi_cs,
    output logic  [1:0]                 spi_mode,
    input  logic                        spi_sdi0,
    input  logic                        spi_sdi1,
    input  logic                        spi_sdi2,
    input  logic                        spi_sdi3,
    output logic                        spi_sdo0,
    output logic                        spi_sdo1,
    output logic                        spi_sdo2,
    output logic                        spi_sdo3,
`endif

`ifdef VIVADO
   input wire 	      mclk,
   input wire 	      rst_n,
   input wire [3:0]  i_gpio,
   output wire [3:0] o_gpio
   );

   wire clk;

   clk_wiz_0 clk_wiz_0_inst
   (
   // Status and control signals               
   .reset(~rst_n), 
   //.locked(locked),
   // Clock in ports
   .clk_in1(mclk),
   // Clock out ports  
   .clk_out1(clk)
   );
`else
   input wire 	    clk,
   input wire        rst_n,
   input wire [3:0]  i_gpio,
   output wire [3:0] o_gpio
   );
`endif

`ifndef SPI_IF
    wire logic                        spi_sclk='b0;
    wire logic                        spi_cs='b0;
    wire logic  [1:0]                 spi_mode;
    wire logic                        spi_sdi0='b0;
    wire logic                        spi_sdi1='b0;
    wire logic                        spi_sdi2='b0;
    wire logic                        spi_sdi3='b0;
    wire logic                        spi_sdo0;
    wire logic                        spi_sdo1;
    wire logic                        spi_sdo2;
    wire logic                        spi_sdo3;
`endif


   wire [31:0] nmi_vec;

`include "axi_intercon.vh"


    axi_spi_slave u_axi_spi_slave
    (
        .test_mode            (1'b0),
        .spi_sclk             (spi_sclk),
        .spi_cs               (spi_cs),
        .spi_mode             (spi_mode),
        .spi_sdi0             (spi_sdi0),
        .spi_sdi1             (spi_sdi1),
        .spi_sdi2             (spi_sdi2),
        .spi_sdi3             (spi_sdi3),
        .spi_sdo0             (spi_sdo0),
        .spi_sdo1             (spi_sdo1),
        .spi_sdo2             (spi_sdo2),
        .spi_sdo3             (spi_sdo3),
        .axi_aclk             (clk                   ),
        .axi_aresetn          (rst_n                 ),
        .axi_master_aw_valid  (host_awvalid          ),
        .axi_master_aw_addr   (host_awaddr           ),
        .axi_master_aw_prot   (host_awprot           ),
        .axi_master_aw_region (host_awregion         ),
        .axi_master_aw_len    (host_awlen            ),
        .axi_master_aw_size   (host_awsize           ),
        .axi_master_aw_burst  (host_awburst          ),
        .axi_master_aw_lock   (host_awlock           ),
        .axi_master_aw_cache  (host_awcache          ),
        .axi_master_aw_qos    (host_awqos            ),
        .axi_master_aw_id     (host_awid             ),
        .axi_master_aw_user   (/*host_awuser*/       ),
        .axi_master_aw_ready  (host_awready          ),
        .axi_master_ar_valid  (host_arvalid          ),
        .axi_master_ar_addr   (host_araddr           ),
        .axi_master_ar_prot   (host_arprot           ),
        .axi_master_ar_region (host_arregion         ),
        .axi_master_ar_len    (host_arlen            ),
        .axi_master_ar_size   (host_arsize           ),
        .axi_master_ar_burst  (host_arburst          ),
        .axi_master_ar_lock   (host_arlock           ),
        .axi_master_ar_cache  (host_arcache          ),
        .axi_master_ar_qos    (host_arqos            ),
        .axi_master_ar_id     (host_arid             ),
        .axi_master_ar_user   (/*host_aruser*/       ),
        .axi_master_ar_ready  (host_arready          ),
        .axi_master_w_valid   (host_wvalid           ),
        .axi_master_w_data    (host_wdata            ),
        .axi_master_w_strb    (host_wstrb            ),
        .axi_master_w_user    (/*host_wuser*/        ),
        .axi_master_w_last    (host_wlast            ),
        .axi_master_w_ready   (host_wready           ),
        .axi_master_r_valid   (host_rvalid           ),
        .axi_master_r_data    (host_rdata            ),
        .axi_master_r_resp    (host_rresp            ),
        .axi_master_r_last    (host_rlast            ),
        .axi_master_r_id      (host_rid              ),
        .axi_master_r_user    (/*host_ruser*/'b0     ),
        .axi_master_r_ready   (host_rready           ),
        .axi_master_b_valid   (host_bvalid           ),
        .axi_master_b_resp    (host_bresp            ),
        .axi_master_b_id      (host_bid              ),
        .axi_master_b_user    (/*host_buser*/'b0     ),
        .axi_master_b_ready   (host_bready           )
        
    );


   wire 		      wb_clk = clk;
   wire 		      wb_rst = ~rst_n;

`include "wb_intercon.vh"

   wire [15:2] 		       wb_adr;

   assign		       wb_m2s_io_adr = {16'd0,wb_adr,2'b00};
   assign wb_m2s_io_cti = 3'b000;
   assign wb_m2s_io_bte = 2'b00;

   axi2wb
     #(.AW (16),
       .IW (5))
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
wire [7:0] o_gpio_int;
assign o_gpio[3:0] =o_gpio_int[7:4] & o_gpio_int[3:0];

   altusoc_syscon syscon
     (.i_clk            (clk),
      .i_rst            (wb_rst),

      .i_gpio           ({60'b0,i_gpio[3:0]}),
      .o_gpio           ({nc1,o_gpio_int[7:4],nc2,o_gpio_int[3:0]}),
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



riscv_tcm_top #(
.BOOTROM_FILE(BOOTROM_FILE)
)
u_riscv_tcm_top 
     (
    .clk(clk),
    .rst(~rst_n),
    .rst_cpu(~rst_n),
    .intr(nmi_vec),

    //AXI Master + Slave interfaces
    .*
);


endmodule
