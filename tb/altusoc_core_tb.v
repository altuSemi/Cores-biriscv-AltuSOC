// SPDX-License-Identifier: Apache-2.0
// Copyright 2019 Western Digital Corporation or its affiliates.
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
// Function: Verilog testbench for SweRVolf
// Comments:
//
//********************************************************************************

`default_nettype none
module altusoc_core_tb
  #(parameter bootrom_file  = "")
`ifdef VERILATOR
  (input wire clk,
   input wire  rst,
   /*input wire  i_jtag_tck,
   input wire  i_jtag_tms,
   input wire  i_jtag_tdi,
   input wire  i_jtag_trst_n,
   output wire o_jtag_tdo,*/
   output wire o_gpio)
`endif
  ;


`ifndef VERILATOR
   reg 	 clk = 1'b0;
   reg 	 rst = 1'b1;
   always #10 clk <= !clk;
   initial #100 rst <= 1'b0;
   wire  o_gpio;
   /*wire i_jtag_tck = 1'b0;
   wire i_jtag_tms = 1'b0;
   wire i_jtag_tdi = 1'b0;
   wire i_jtag_trst_n = 1'b0;
   wire o_jtag_tdo;*/

`endif


   initial begin
//	$readmemh("data.hex",     altusoc.rvtop.lmem.mem);
//        $readmemh("program.hex",  altusoc.rvtop.imem.mem);

 /*     if (|$test$plusargs("jtag_vpi_enable"))
	$display("JTAG VPI enabled. Not loading RAM");
      else if ($value$plusargs("ram_init_file=%s", ram_init_file)) begin
	 $display("Loading RAM contents from %0s", ram_init_file);
	 $readmemh(ram_init_file, ram.ram.mem);
      end*/
   end

   reg [1023:0] rom_init_file;
   reg [7:0] mem[131072:0];
   integer i, f;

   initial begin
      if ($value$plusargs("rom_init_file=%s", rom_init_file)) begin
	 $display("Loading ROM contents from %0s", rom_init_file);
	 // Load TCM memory
         for (i=0;i<131072;i=i+1)
            mem[i] = 0;

         //f = $fopenr(rom_init_file);
         //i = $fread(mem, f);
	 $readmemh(rom_init_file, mem);
         for (i=0;i<131072;i=i+1)
            altusoc.u_riscv_tcm_top.u_tcm.write(i, mem[i]);
            
	 //$readmemh(rom_init_file, altusoc.u_riscv_tcm_top.u_tcm.u_rom.rom);
      end /*else if (!(|bootrom_file))
	//Jump to address 0 if no bootloader is selected
	altusoc.imem.mem[0] = 64'h0000000000000067;*/
   end
   
   integer cycleCnt=0;
 always @(negedge clk) begin
        cycleCnt <= cycleCnt+1;
        // Test timeout monitor
        if(cycleCnt == 100000 ) begin
            $display ("Hit max cycle count (%0d) .. stopping",cycleCnt);
            $finish;
        end
end
   wire [63:0] gpio_out;
   assign o_gpio = gpio_out[0];

   /*wire        dmi_reg_en;
   wire [6:0]  dmi_reg_addr;
   wire        dmi_reg_wr_en;
   wire [31:0] dmi_reg_wdata;
   wire [31:0] dmi_reg_rdata;
   wire        dmi_hard_reset;
   
   dmi_wrapper dmi_wrapper
     (.trst_n    (i_jtag_trst_n),
      .tck       (i_jtag_tck),
      .tms       (i_jtag_tms),
      .tdi       (i_jtag_tdi),
      .tdo       (o_jtag_tdo),
      .tdoEnable (),
      // Processor Signals
      .scan_mode      (1'b0),
      .core_rst_n     (!rst),
      .core_clk       (clk),
      .jtag_id        (31'd0),
      .rd_data        (dmi_reg_rdata),
      .reg_wr_data    (dmi_reg_wdata),
      .reg_wr_addr    (dmi_reg_addr),
      .reg_en         (dmi_reg_en),
      .reg_wr_en      (dmi_reg_wr_en),
      .dmi_hard_reset (dmi_hard_reset)); 
*/
   altusoc_core
//     #(.bootrom_file (bootrom_file))
   altusoc
     (.clk  (clk),
      .rstn (!rst),
      /*.dmi_reg_rdata       (dmi_reg_rdata),
      .dmi_reg_wdata       (dmi_reg_wdata),
      .dmi_reg_addr        (dmi_reg_addr),
      .dmi_reg_en          (dmi_reg_en),
      .dmi_reg_wr_en       (dmi_reg_wr_en),
      .dmi_hard_reset      (dmi_hard_reset),*/
      .i_gpio              (8'd0),
      .o_gpio              (gpio_out[3:0]));

endmodule
