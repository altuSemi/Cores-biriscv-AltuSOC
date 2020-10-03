// THIS FILE IS AUTOGENERATED BY axi_intercon_gen
// ANY MANUAL CHANGES WILL BE LOST
`default_nettype none
module axi_intercon
   (input  wire        clk_i,
    input  wire        rst_ni,
    input  wire  [2:0] i_host_awid,
    input  wire [31:0] i_host_awaddr,
    input  wire  [7:0] i_host_awlen,
    input  wire  [2:0] i_host_awsize,
    input  wire  [1:0] i_host_awburst,
    input  wire        i_host_awlock,
    input  wire  [3:0] i_host_awcache,
    input  wire  [2:0] i_host_awprot,
    input  wire  [3:0] i_host_awregion,
    input  wire  [3:0] i_host_awqos,
    input  wire        i_host_awvalid,
    output wire        o_host_awready,
    input  wire  [2:0] i_host_arid,
    input  wire [31:0] i_host_araddr,
    input  wire  [7:0] i_host_arlen,
    input  wire  [2:0] i_host_arsize,
    input  wire  [1:0] i_host_arburst,
    input  wire        i_host_arlock,
    input  wire  [3:0] i_host_arcache,
    input  wire  [2:0] i_host_arprot,
    input  wire  [3:0] i_host_arregion,
    input  wire  [3:0] i_host_arqos,
    input  wire        i_host_arvalid,
    output wire        o_host_arready,
    input  wire [63:0] i_host_wdata,
    input  wire  [7:0] i_host_wstrb,
    input  wire        i_host_wlast,
    input  wire        i_host_wvalid,
    output wire        o_host_wready,
    output wire  [2:0] o_host_bid,
    output wire  [1:0] o_host_bresp,
    output wire        o_host_bvalid,
    input  wire        i_host_bready,
    output wire  [2:0] o_host_rid,
    output wire [63:0] o_host_rdata,
    output wire  [1:0] o_host_rresp,
    output wire        o_host_rlast,
    output wire        o_host_rvalid,
    input  wire        i_host_rready,
    input  wire  [3:0] i_riscv_mst_awid,
    input  wire [31:0] i_riscv_mst_awaddr,
    input  wire  [7:0] i_riscv_mst_awlen,
    input  wire  [2:0] i_riscv_mst_awsize,
    input  wire  [1:0] i_riscv_mst_awburst,
    input  wire        i_riscv_mst_awlock,
    input  wire  [3:0] i_riscv_mst_awcache,
    input  wire  [2:0] i_riscv_mst_awprot,
    input  wire  [3:0] i_riscv_mst_awregion,
    input  wire  [3:0] i_riscv_mst_awqos,
    input  wire        i_riscv_mst_awvalid,
    output wire        o_riscv_mst_awready,
    input  wire  [3:0] i_riscv_mst_arid,
    input  wire [31:0] i_riscv_mst_araddr,
    input  wire  [7:0] i_riscv_mst_arlen,
    input  wire  [2:0] i_riscv_mst_arsize,
    input  wire  [1:0] i_riscv_mst_arburst,
    input  wire        i_riscv_mst_arlock,
    input  wire  [3:0] i_riscv_mst_arcache,
    input  wire  [2:0] i_riscv_mst_arprot,
    input  wire  [3:0] i_riscv_mst_arregion,
    input  wire  [3:0] i_riscv_mst_arqos,
    input  wire        i_riscv_mst_arvalid,
    output wire        o_riscv_mst_arready,
    input  wire [63:0] i_riscv_mst_wdata,
    input  wire  [7:0] i_riscv_mst_wstrb,
    input  wire        i_riscv_mst_wlast,
    input  wire        i_riscv_mst_wvalid,
    output wire        o_riscv_mst_wready,
    output wire  [3:0] o_riscv_mst_bid,
    output wire  [1:0] o_riscv_mst_bresp,
    output wire        o_riscv_mst_bvalid,
    input  wire        i_riscv_mst_bready,
    output wire  [3:0] o_riscv_mst_rid,
    output wire [63:0] o_riscv_mst_rdata,
    output wire  [1:0] o_riscv_mst_rresp,
    output wire        o_riscv_mst_rlast,
    output wire        o_riscv_mst_rvalid,
    input  wire        i_riscv_mst_rready,
    output wire  [4:0] o_io_awid,
    output wire [31:0] o_io_awaddr,
    output wire  [7:0] o_io_awlen,
    output wire  [2:0] o_io_awsize,
    output wire  [1:0] o_io_awburst,
    output wire        o_io_awlock,
    output wire  [3:0] o_io_awcache,
    output wire  [2:0] o_io_awprot,
    output wire  [3:0] o_io_awregion,
    output wire  [3:0] o_io_awqos,
    output wire        o_io_awvalid,
    input  wire        i_io_awready,
    output wire  [4:0] o_io_arid,
    output wire [31:0] o_io_araddr,
    output wire  [7:0] o_io_arlen,
    output wire  [2:0] o_io_arsize,
    output wire  [1:0] o_io_arburst,
    output wire        o_io_arlock,
    output wire  [3:0] o_io_arcache,
    output wire  [2:0] o_io_arprot,
    output wire  [3:0] o_io_arregion,
    output wire  [3:0] o_io_arqos,
    output wire        o_io_arvalid,
    input  wire        i_io_arready,
    output wire [63:0] o_io_wdata,
    output wire  [7:0] o_io_wstrb,
    output wire        o_io_wlast,
    output wire        o_io_wvalid,
    input  wire        i_io_wready,
    input  wire  [4:0] i_io_bid,
    input  wire  [1:0] i_io_bresp,
    input  wire        i_io_bvalid,
    output wire        o_io_bready,
    input  wire  [4:0] i_io_rid,
    input  wire [63:0] i_io_rdata,
    input  wire  [1:0] i_io_rresp,
    input  wire        i_io_rlast,
    input  wire        i_io_rvalid,
    output wire        o_io_rready,
    output wire  [4:0] o_riscv_slv_awid,
    output wire [31:0] o_riscv_slv_awaddr,
    output wire  [7:0] o_riscv_slv_awlen,
    output wire  [2:0] o_riscv_slv_awsize,
    output wire  [1:0] o_riscv_slv_awburst,
    output wire        o_riscv_slv_awlock,
    output wire  [3:0] o_riscv_slv_awcache,
    output wire  [2:0] o_riscv_slv_awprot,
    output wire  [3:0] o_riscv_slv_awregion,
    output wire  [3:0] o_riscv_slv_awqos,
    output wire        o_riscv_slv_awvalid,
    input  wire        i_riscv_slv_awready,
    output wire  [4:0] o_riscv_slv_arid,
    output wire [31:0] o_riscv_slv_araddr,
    output wire  [7:0] o_riscv_slv_arlen,
    output wire  [2:0] o_riscv_slv_arsize,
    output wire  [1:0] o_riscv_slv_arburst,
    output wire        o_riscv_slv_arlock,
    output wire  [3:0] o_riscv_slv_arcache,
    output wire  [2:0] o_riscv_slv_arprot,
    output wire  [3:0] o_riscv_slv_arregion,
    output wire  [3:0] o_riscv_slv_arqos,
    output wire        o_riscv_slv_arvalid,
    input  wire        i_riscv_slv_arready,
    output wire [63:0] o_riscv_slv_wdata,
    output wire  [7:0] o_riscv_slv_wstrb,
    output wire        o_riscv_slv_wlast,
    output wire        o_riscv_slv_wvalid,
    input  wire        i_riscv_slv_wready,
    input  wire  [4:0] i_riscv_slv_bid,
    input  wire  [1:0] i_riscv_slv_bresp,
    input  wire        i_riscv_slv_bvalid,
    output wire        o_riscv_slv_bready,
    input  wire  [4:0] i_riscv_slv_rid,
    input  wire [63:0] i_riscv_slv_rdata,
    input  wire  [1:0] i_riscv_slv_rresp,
    input  wire        i_riscv_slv_rlast,
    input  wire        i_riscv_slv_rvalid,
    output wire        o_riscv_slv_rready);


  localparam int unsigned NoMasters   = 32'd2;    // How many Axi Masters there are
  localparam int unsigned NoSlaves    = 32'd2;    // How many Axi Slaves  there are

  // axi configuration
  localparam int unsigned AxiIdWidthMasters =  32'd4;
  localparam int unsigned AxiIdUsed         =  32'd4; // Has to be <= AxiIdWidthMasters
  localparam int unsigned AxiIdWidthSlaves  =  AxiIdWidthMasters + $clog2(NoMasters);
  localparam int unsigned AxiAddrWidth      =  32'd32;    // Axi Address Width
  localparam int unsigned AxiDataWidth      =  32'd64;    // Axi Data Width
  localparam int unsigned AxiStrbWidth      =  AxiDataWidth / 8;
  localparam int unsigned AxiUserWidth      =  1;
  localparam axi_pkg::xbar_cfg_t xbar_cfg = '{

    NoSlvPorts:         NoMasters,
    NoMstPorts:         NoSlaves,
    MaxMstTrans:        10,
    MaxSlvTrans:        6,
    FallThrough:        1'b0,
    LatencyMode:        axi_pkg::CUT_ALL_AX,
    AxiIdWidthSlvPorts: AxiIdWidthMasters,
    AxiIdUsedSlvPorts:  AxiIdUsed,
    AxiAddrWidth:       AxiAddrWidth,
    AxiDataWidth:       AxiDataWidth,
    NoAddrRules:        NoSlaves
  };

  typedef logic [AxiIdWidthMasters-1:0] id_mst_t;
  typedef logic [AxiIdWidthSlaves-1:0]  id_slv_t;
  typedef logic [AxiAddrWidth-1:0]      addr_t;
  typedef axi_pkg::xbar_rule_32_t       rule_t; // Has to be the same width as axi addr
  typedef logic [AxiDataWidth-1:0]      data_t;
  typedef logic [AxiStrbWidth-1:0]      strb_t;
  typedef logic [AxiUserWidth-1:0]      user_t;

  `AXI_TYPEDEF_AW_CHAN_T(aw_chan_mst_t, addr_t, id_mst_t, user_t)
  `AXI_TYPEDEF_AW_CHAN_T(aw_chan_slv_t, addr_t, id_slv_t, user_t)
  `AXI_TYPEDEF_W_CHAN_T(w_chan_t, data_t, strb_t, user_t)
  `AXI_TYPEDEF_B_CHAN_T(b_chan_mst_t, id_mst_t, user_t)
  `AXI_TYPEDEF_B_CHAN_T(b_chan_slv_t, id_slv_t, user_t)

  `AXI_TYPEDEF_AR_CHAN_T(ar_chan_mst_t, addr_t, id_mst_t, user_t)
  `AXI_TYPEDEF_AR_CHAN_T(ar_chan_slv_t, addr_t, id_slv_t, user_t)
  `AXI_TYPEDEF_R_CHAN_T(r_chan_mst_t, data_t, id_mst_t, user_t)
  `AXI_TYPEDEF_R_CHAN_T(r_chan_slv_t, data_t, id_slv_t, user_t)

  `AXI_TYPEDEF_REQ_T(mst_req_t, aw_chan_mst_t, w_chan_t, ar_chan_mst_t)
  `AXI_TYPEDEF_RESP_T(mst_resp_t, b_chan_mst_t, r_chan_mst_t)
  `AXI_TYPEDEF_REQ_T(slv_req_t, aw_chan_slv_t, w_chan_t, ar_chan_slv_t)
  `AXI_TYPEDEF_RESP_T(slv_resp_t, b_chan_slv_t, r_chan_slv_t)

  localparam rule_t [1:0] AddrMap = '{
    '{idx: 32'd0, start_addr: 32'h10000000, end_addr: 32'h10010000},
    '{idx: 32'd1, start_addr: 32'h00000000, end_addr: 32'h00010000}};
   mst_req_t  [1:0] masters_req;
   mst_resp_t [1:0] masters_resp;
   slv_req_t  [1:0] slaves_req;
   slv_resp_t [1:0] slaves_resp;

   //Master host
   assign masters_req[0].aw.id = {1'd0,i_host_awid};
   assign masters_req[0].aw.addr = i_host_awaddr;
   assign masters_req[0].aw.len = i_host_awlen;
   assign masters_req[0].aw.size = i_host_awsize;
   assign masters_req[0].aw.burst = i_host_awburst;
   assign masters_req[0].aw.lock = i_host_awlock;
   assign masters_req[0].aw.cache = i_host_awcache;
   assign masters_req[0].aw.prot = i_host_awprot;
   assign masters_req[0].aw.region = i_host_awregion;
   assign masters_req[0].aw.qos = i_host_awqos;
   assign masters_req[0].aw.atop = 6'd0;
   assign masters_req[0].aw_valid = i_host_awvalid;
   assign o_host_awready = masters_resp[0].aw_ready;
   assign masters_req[0].ar.id = {1'd0,i_host_arid};
   assign masters_req[0].ar.addr = i_host_araddr;
   assign masters_req[0].ar.len = i_host_arlen;
   assign masters_req[0].ar.size = i_host_arsize;
   assign masters_req[0].ar.burst = i_host_arburst;
   assign masters_req[0].ar.lock = i_host_arlock;
   assign masters_req[0].ar.cache = i_host_arcache;
   assign masters_req[0].ar.prot = i_host_arprot;
   assign masters_req[0].ar.region = i_host_arregion;
   assign masters_req[0].ar.qos = i_host_arqos;
   assign masters_req[0].ar_valid = i_host_arvalid;
   assign o_host_arready = masters_resp[0].ar_ready;
   assign masters_req[0].w.data = i_host_wdata;
   assign masters_req[0].w.strb = i_host_wstrb;
   assign masters_req[0].w.last = i_host_wlast;
   assign masters_req[0].w_valid = i_host_wvalid;
   assign o_host_wready = masters_resp[0].w_ready;
   assign o_host_bid = masters_resp[0].b.id[2:0];
   assign o_host_bresp = masters_resp[0].b.resp;
   assign o_host_bvalid = masters_resp[0].b_valid;
   assign masters_req[0].b_ready = i_host_bready;
   assign o_host_rid = masters_resp[0].r.id[2:0];
   assign o_host_rdata = masters_resp[0].r.data;
   assign o_host_rresp = masters_resp[0].r.resp;
   assign o_host_rlast = masters_resp[0].r.last;
   assign o_host_rvalid = masters_resp[0].r_valid;
   assign masters_req[0].r_ready = i_host_rready;

   //Master riscv_mst
   assign masters_req[1].aw.id = i_riscv_mst_awid;
   assign masters_req[1].aw.addr = i_riscv_mst_awaddr;
   assign masters_req[1].aw.len = i_riscv_mst_awlen;
   assign masters_req[1].aw.size = i_riscv_mst_awsize;
   assign masters_req[1].aw.burst = i_riscv_mst_awburst;
   assign masters_req[1].aw.lock = i_riscv_mst_awlock;
   assign masters_req[1].aw.cache = i_riscv_mst_awcache;
   assign masters_req[1].aw.prot = i_riscv_mst_awprot;
   assign masters_req[1].aw.region = i_riscv_mst_awregion;
   assign masters_req[1].aw.qos = i_riscv_mst_awqos;
   assign masters_req[1].aw.atop = 6'd0;
   assign masters_req[1].aw_valid = i_riscv_mst_awvalid;
   assign o_riscv_mst_awready = masters_resp[1].aw_ready;
   assign masters_req[1].ar.id = i_riscv_mst_arid;
   assign masters_req[1].ar.addr = i_riscv_mst_araddr;
   assign masters_req[1].ar.len = i_riscv_mst_arlen;
   assign masters_req[1].ar.size = i_riscv_mst_arsize;
   assign masters_req[1].ar.burst = i_riscv_mst_arburst;
   assign masters_req[1].ar.lock = i_riscv_mst_arlock;
   assign masters_req[1].ar.cache = i_riscv_mst_arcache;
   assign masters_req[1].ar.prot = i_riscv_mst_arprot;
   assign masters_req[1].ar.region = i_riscv_mst_arregion;
   assign masters_req[1].ar.qos = i_riscv_mst_arqos;
   assign masters_req[1].ar_valid = i_riscv_mst_arvalid;
   assign o_riscv_mst_arready = masters_resp[1].ar_ready;
   assign masters_req[1].w.data = i_riscv_mst_wdata;
   assign masters_req[1].w.strb = i_riscv_mst_wstrb;
   assign masters_req[1].w.last = i_riscv_mst_wlast;
   assign masters_req[1].w_valid = i_riscv_mst_wvalid;
   assign o_riscv_mst_wready = masters_resp[1].w_ready;
   assign o_riscv_mst_bid = masters_resp[1].b.id;
   assign o_riscv_mst_bresp = masters_resp[1].b.resp;
   assign o_riscv_mst_bvalid = masters_resp[1].b_valid;
   assign masters_req[1].b_ready = i_riscv_mst_bready;
   assign o_riscv_mst_rid = masters_resp[1].r.id;
   assign o_riscv_mst_rdata = masters_resp[1].r.data;
   assign o_riscv_mst_rresp = masters_resp[1].r.resp;
   assign o_riscv_mst_rlast = masters_resp[1].r.last;
   assign o_riscv_mst_rvalid = masters_resp[1].r_valid;
   assign masters_req[1].r_ready = i_riscv_mst_rready;

   //Slave io
   assign o_io_awid = slaves_req[0].aw.id;
   assign o_io_awaddr = slaves_req[0].aw.addr;
   assign o_io_awlen = slaves_req[0].aw.len;
   assign o_io_awsize = slaves_req[0].aw.size;
   assign o_io_awburst = slaves_req[0].aw.burst;
   assign o_io_awlock = slaves_req[0].aw.lock;
   assign o_io_awcache = slaves_req[0].aw.cache;
   assign o_io_awprot = slaves_req[0].aw.prot;
   assign o_io_awregion = slaves_req[0].aw.region;
   assign o_io_awqos = slaves_req[0].aw.qos;
   assign o_io_awvalid = slaves_req[0].aw_valid;
   assign slaves_resp[0].aw_ready = i_io_awready;
   assign o_io_arid = slaves_req[0].ar.id;
   assign o_io_araddr = slaves_req[0].ar.addr;
   assign o_io_arlen = slaves_req[0].ar.len;
   assign o_io_arsize = slaves_req[0].ar.size;
   assign o_io_arburst = slaves_req[0].ar.burst;
   assign o_io_arlock = slaves_req[0].ar.lock;
   assign o_io_arcache = slaves_req[0].ar.cache;
   assign o_io_arprot = slaves_req[0].ar.prot;
   assign o_io_arregion = slaves_req[0].ar.region;
   assign o_io_arqos = slaves_req[0].ar.qos;
   assign o_io_arvalid = slaves_req[0].ar_valid;
   assign slaves_resp[0].ar_ready = i_io_arready;
   assign o_io_wdata = slaves_req[0].w.data;
   assign o_io_wstrb = slaves_req[0].w.strb;
   assign o_io_wlast = slaves_req[0].w.last;
   assign o_io_wvalid = slaves_req[0].w_valid;
   assign slaves_resp[0].w_ready = i_io_wready;
   assign slaves_resp[0].b.id = i_io_bid;
   assign slaves_resp[0].b.resp = i_io_bresp;
   assign slaves_resp[0].b_valid = i_io_bvalid;
   assign o_io_bready = slaves_req[0].b_ready;
   assign slaves_resp[0].r.id = i_io_rid;
   assign slaves_resp[0].r.data = i_io_rdata;
   assign slaves_resp[0].r.resp = i_io_rresp;
   assign slaves_resp[0].r.last = i_io_rlast;
   assign slaves_resp[0].r_valid = i_io_rvalid;
   assign o_io_rready = slaves_req[0].r_ready;

   //Slave riscv_slv
   assign o_riscv_slv_awid = slaves_req[1].aw.id;
   assign o_riscv_slv_awaddr = slaves_req[1].aw.addr;
   assign o_riscv_slv_awlen = slaves_req[1].aw.len;
   assign o_riscv_slv_awsize = slaves_req[1].aw.size;
   assign o_riscv_slv_awburst = slaves_req[1].aw.burst;
   assign o_riscv_slv_awlock = slaves_req[1].aw.lock;
   assign o_riscv_slv_awcache = slaves_req[1].aw.cache;
   assign o_riscv_slv_awprot = slaves_req[1].aw.prot;
   assign o_riscv_slv_awregion = slaves_req[1].aw.region;
   assign o_riscv_slv_awqos = slaves_req[1].aw.qos;
   assign o_riscv_slv_awvalid = slaves_req[1].aw_valid;
   assign slaves_resp[1].aw_ready = i_riscv_slv_awready;
   assign o_riscv_slv_arid = slaves_req[1].ar.id;
   assign o_riscv_slv_araddr = slaves_req[1].ar.addr;
   assign o_riscv_slv_arlen = slaves_req[1].ar.len;
   assign o_riscv_slv_arsize = slaves_req[1].ar.size;
   assign o_riscv_slv_arburst = slaves_req[1].ar.burst;
   assign o_riscv_slv_arlock = slaves_req[1].ar.lock;
   assign o_riscv_slv_arcache = slaves_req[1].ar.cache;
   assign o_riscv_slv_arprot = slaves_req[1].ar.prot;
   assign o_riscv_slv_arregion = slaves_req[1].ar.region;
   assign o_riscv_slv_arqos = slaves_req[1].ar.qos;
   assign o_riscv_slv_arvalid = slaves_req[1].ar_valid;
   assign slaves_resp[1].ar_ready = i_riscv_slv_arready;
   assign o_riscv_slv_wdata = slaves_req[1].w.data;
   assign o_riscv_slv_wstrb = slaves_req[1].w.strb;
   assign o_riscv_slv_wlast = slaves_req[1].w.last;
   assign o_riscv_slv_wvalid = slaves_req[1].w_valid;
   assign slaves_resp[1].w_ready = i_riscv_slv_wready;
   assign slaves_resp[1].b.id = i_riscv_slv_bid;
   assign slaves_resp[1].b.resp = i_riscv_slv_bresp;
   assign slaves_resp[1].b_valid = i_riscv_slv_bvalid;
   assign o_riscv_slv_bready = slaves_req[1].b_ready;
   assign slaves_resp[1].r.id = i_riscv_slv_rid;
   assign slaves_resp[1].r.data = i_riscv_slv_rdata;
   assign slaves_resp[1].r.resp = i_riscv_slv_rresp;
   assign slaves_resp[1].r.last = i_riscv_slv_rlast;
   assign slaves_resp[1].r_valid = i_riscv_slv_rvalid;
   assign o_riscv_slv_rready = slaves_req[1].r_ready;


axi_xbar
  #(.Cfg           (xbar_cfg),
    .slv_aw_chan_t (aw_chan_mst_t),
    .mst_aw_chan_t (aw_chan_slv_t),
    .w_chan_t      (w_chan_t),
    .slv_b_chan_t  (b_chan_mst_t),
    .mst_b_chan_t  (b_chan_slv_t),
    .slv_ar_chan_t (ar_chan_mst_t),
    .mst_ar_chan_t (ar_chan_slv_t),
    .slv_r_chan_t  (r_chan_mst_t),
    .mst_r_chan_t  (r_chan_slv_t),
    .slv_req_t     (mst_req_t),
    .slv_resp_t    (mst_resp_t),
    .mst_req_t     (slv_req_t),
    .mst_resp_t    (slv_resp_t),
    .rule_t        (rule_t))
 axi_xbar
   (.clk_i                 (clk_i),
    .rst_ni                (rst_ni),
    .test_i                (1'b0),
    .slv_ports_req_i       (masters_req),
    .slv_ports_resp_o      (masters_resp),
    .mst_ports_req_o       (slaves_req),
    .mst_ports_resp_i      (slaves_resp),
    .addr_map_i            (AddrMap),
    .en_default_mst_port_i (2'd0),
    .default_mst_port_i    (0));

endmodule
