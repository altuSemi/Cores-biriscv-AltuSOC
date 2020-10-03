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
// Function: AltuSOC SoC-level controller (Modifed from SweRVolf)
// Comments:
// Altus 09/15/2020 - removed mtime, mtimecmp - exist in biriscv
//                    remove irq
//                    merge nmi_int into nmi_vec[30]
//                    add write address error interupt @ nmi_vec[31]
//********************************************************************************

module altusoc_syscon
  (input wire i_clk,
   input wire 	     i_rst,

   input wire [63:0] i_gpio,
   output reg [63:0] o_gpio,
   output reg [31:0] o_nmi_vec,

   input wire [5:0]  i_wb_adr,
   input wire [31:0] i_wb_dat,
   input wire [3:0]  i_wb_sel,
   input wire 	     i_wb_we,
   input wire 	     i_wb_cyc,
   input wire 	     i_wb_stb,
   output reg [31:0] o_wb_rdt,
   output reg 	     o_wb_ack);


   reg 		 irq_timer_en;
   reg [31:0] 	 irq_timer_cnt;

   reg 		 nmi_int;
   reg 		 nmi_int_r;

`ifdef SIMPRINT
   reg [1023:0]  signature_file;
   integer 	f = 0;
   initial begin
      if ($value$plusargs("signature=%s", signature_file)) begin
	 $display("Writing signature to %0s", signature_file);
	 f = $fopen(signature_file, "w");
      end
   end
`endif


   wire [31:0] version='b0;



   wire reg_we = i_wb_cyc & i_wb_stb & i_wb_we & !o_wb_ack;

   //00 = ver
   //04 = sha
   //08 = simprint
   //09 = simexit
   //10 = gpio
   //30 = timer
   always @(posedge i_clk) begin
      if (i_rst) begin
	 o_wb_ack <= 1'b0;
         irq_timer_cnt <= 'b0;
	 irq_timer_en <= 1'b0;
         nmi_int <= 1'b0;
         nmi_int_r <= 1'b0;
	 o_nmi_vec <= 'b0;
	 o_gpio <= 'b0;
	 o_wb_rdt <= 'b0;
      end
      else begin
         o_wb_ack <= i_wb_cyc & !o_wb_ack;

         if (irq_timer_en)	irq_timer_cnt <= irq_timer_cnt - 1;

         nmi_int   <= 1'b0;
         nmi_int_r <= nmi_int;

         if (irq_timer_cnt == 32'd1) begin
	     irq_timer_en <= 1'b0;
	     nmi_int <= 1'b1;
         end
         o_nmi_vec[30] <= nmi_int | nmi_int_r;

         if (reg_we)
	 case (i_wb_adr[5:2])
	  2: begin //0x08-0x0B
`ifdef SIMPRINT
	     if (i_wb_sel[0]) begin
		if (|f) $fwrite(f, "%c", i_wb_dat[7:0]);
		$write("%c", i_wb_dat[7:0]);
		$display("Led %d is set to %d", i_wb_dat[7:0]%16, i_wb_dat[7:0]>>4);
	     end
	     if (i_wb_sel[1]) begin
		$display("\nFinito (Write to address 0x%h)",i_wb_adr[5:2]<<2);
		$finish;
	     end
`endif
	  end
	  3: begin //0x0C-0x0F
	     if (i_wb_sel[0]) o_nmi_vec[7:0]   <= i_wb_dat[7:0];
	     if (i_wb_sel[1]) o_nmi_vec[15:8]  <= i_wb_dat[15:8];
	     if (i_wb_sel[2]) o_nmi_vec[23:16] <= i_wb_dat[23:16];
	     if (i_wb_sel[3]) o_nmi_vec[31:24] <= i_wb_dat[31:24];
	  end
	  4 : begin //0x10-0x13
	     if (i_wb_sel[0]) o_gpio[7:0]   <= i_wb_dat[7:0]  ;
	     if (i_wb_sel[1]) o_gpio[15:8]  <= i_wb_dat[15:8] ;
	     if (i_wb_sel[2]) o_gpio[23:16] <= i_wb_dat[23:16];
	     if (i_wb_sel[3]) o_gpio[31:24] <= i_wb_dat[31:24];
	  end
	  5: begin //0x14-0x17
	     if (i_wb_sel[0]) o_gpio[39:32] <= i_wb_dat[7:0];
	     if (i_wb_sel[1]) o_gpio[47:40] <= i_wb_dat[15:8];
	     if (i_wb_sel[2]) o_gpio[55:48] <= i_wb_dat[23:16];
	     if (i_wb_sel[3]) o_gpio[63:56] <= i_wb_dat[31:24];
	  end
	  12 : begin //0x30-3f
	     if (i_wb_sel[0]) irq_timer_cnt[7:0]   <= i_wb_dat[7:0]  ;
	     if (i_wb_sel[1]) irq_timer_cnt[15:8]  <= i_wb_dat[15:8] ;
	     if (i_wb_sel[2]) irq_timer_cnt[23:16] <= i_wb_dat[23:16];
	     if (i_wb_sel[3]) irq_timer_cnt[31:24] <= i_wb_dat[31:24];
	  end
	  13 : begin
	     if (i_wb_sel[0])
	       irq_timer_en <= i_wb_dat[0];
	  end
	  default: begin
		o_nmi_vec[31] <= 1'b1; //Altus: Address out of range, interrupt
	  end
	endcase

        case (i_wb_adr[5:2])
	  //0x00-0x03
  	  0 : o_wb_rdt <= version;
 	  //0x04-0x07
	  1 : o_wb_rdt <= 32'h0;//32'h`VERSION_SHA;
	  //0xC-0xF
 	  3 : o_wb_rdt <= o_nmi_vec;
	  //0x10-0x13
	  4 : o_wb_rdt <= o_gpio[31:0];
	  //0x14-0x17
	  5 : o_wb_rdt <= o_gpio[63:32];
	  //0x18-0x1B
	  6 : o_wb_rdt <= i_gpio[31:0];
	  //0x1C-0x1F
	  7 : o_wb_rdt <= i_gpio[63:32];
	  //0x30-0x33
	  12 : o_wb_rdt <= irq_timer_cnt;
	  //0x34-0x37
	  13 : o_wb_rdt <= {31'd0, irq_timer_en};
        endcase
       end
     end
endmodule
