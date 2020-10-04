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
// Function: Verilog testbench for AltuSOC( Modified from SwerVolf)
// Comments:
//
//********************************************************************************

`default_nettype none
//`timescale 1ns/1ps
`define VERILATOR
module altusoc_core_vivado_tb
  #(parameter bootrom_file  = "")
  ;
   reg 	 clk;
   reg 	 rst;
   always #5 clk <= !clk;
   initial 
   begin
     clk=1'b0;
     rst=1'b1;

     #100 rst <= 1'b0;

   end
   wire o_gpio;

   

   reg [1023:0] rom_init_file;
   reg [7:0] mem[131072:0];
   integer i, f;

   initial begin
      if ($value$plusargs("rom_init_file=%s", rom_init_file)) begin
	 $display("Loading ROM contents from %0s", rom_init_file);
	 // Load TCM memory
         for (i=0;i<131072;i=i+1)
            mem[i] = 0;

         $readmemh(rom_init_file, mem);
         //Altus: Uncomment if not using ROM:
         //for (i=0;i<16384;i=i+1)
         //altusoc.u_riscv_tcm_top.u_tcm.write(i, mem[i]);
	     //$readmemh(rom_init_file, altusoc.u_riscv_tcm_top.u_tcm.u_rom.rom);
      end
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
   wire [3:0] gpio_out;
   assign o_gpio = gpio_out[0];

 
   altusoc_core
   #(.BOOTROM_FILE (bootrom_file))
   altusoc
     (.clk  (clk),
      .rst_n (!rst),
      .i_gpio              ({gpio_out[3:1],1'b1}),
      .o_gpio              (gpio_out[3:0])
      );

endmodule
