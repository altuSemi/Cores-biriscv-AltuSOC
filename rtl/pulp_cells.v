//!********************************************************************************
//! $Id$
//!
//! Function: Pulp common cells
//! Modifications copyright (C) 2020 altusemi
//! Comments:
//!********************************************************************************
module pulp_clock_inverter
(
        clk_i,
        clk_o
);
input clk_i;
output clk_o;

assign clk_o=~clk_i;

endmodule


module pulp_clock_mux2
(
        clk0_i,
        clk1_i,
        clk_sel_i,
	    clk_o
);
input clk0_i,clk1_i;
input clk_sel_i;

output clk_o;

assign clk_o=(clk_sel_i) ? clk1_i : clk0_i;

endmodule

module onehot_to_bin 
#(
	parameter ONEHOT_WIDTH = 8
)
(
	input  [ONEHOT_WIDTH-1:0]      onehot,
	output reg [$clog2(ONEHOT_WIDTH)-1:0] bin
);


integer i;
always @(*)
begin
	for(i=0;i<ONEHOT_WIDTH;i=i+1)
		if(onehot[i]==1) bin=i;
	end
endmodule



