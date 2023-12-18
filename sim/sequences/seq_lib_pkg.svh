
`ifndef SEQ_PKG_SV
`define SEQ_PKG_SV

package seq_lib_pkg;
	
import uvm_pkg::*;
`include "uvm_macros.svh"

	import env_pkg::*;
	import agent_pkg::*;

	`include "transaction.svh"
	`include "read_data.svh"
	`include "reset_dut.svh"
	`include "write_data.svh"

endpackage : seq_lib_pkg
`endif

