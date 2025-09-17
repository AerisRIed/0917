
`ifdef TB_TOP
`define TB_TOP
//----------------------------------------------------------------------------
// Required timescale for sequence delays.
//----------------------------------------------------------------------------
`timescale 1ns/1fs

//----------------------------------------------------------------------------
// Import Packages
//----------------------------------------------------------------------------
`include "uvm_macros.svh"
import uvm_pkg::*;
import tb_pkg::*; //todo
//import clk_pkg::*; //todo
//import clk_if_pkg::*; //todo

//----------------------------------------------------------------------------
// Add the test library
//----------------------------------------------------------------------------
import test_package::*;//todo

//----------------------------------------------------------------------------
// Create the testbench.
//----------------------------------------------------------------------------
module top;

//control interface 
`GEN_CONTROL_INTERFACE(`LANE_NUM,lan_num)
//serial interface 
`GEN_SERIAL_INTERFACE(`LANE_NUM,lan_num)
//pipe interface 
`GEN_PIPE_INTERFACE(`LANE_NUM,lan_num)

include "top_connection.sv"
logic clk;

logic rst;
parameter clk_period = 10;
parameter rst_delay = 50;
//reset 
initial begin
    rst = 0;
    rst = 1;
    repeat (rst_delay) @(posedge clk);
    rst = 0;    
end
//clk
forever begin
   #(clk_period) clk = ~clk;
end

initial begin
    run_test();
    $stimeformat(-9, 1, " ns", 10);
end

endmodule : top

`endif//`define TOP