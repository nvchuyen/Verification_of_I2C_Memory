//------------------------------------------------
// Nguyen Van Chuyen
// 2023-11-06
//
//
//-------------------------------------------------
//
// Class Description
//
/////////////////////////////////////////////////////////
 
class test extends uvm_test;
    `uvm_component_utils(test)
 
    function new(input string inst = "test", uvm_component c);
        super.new(inst,c);
    endfunction
 
    env e;
    write_data wdata; 
    read_data rdata;
    reset_dut rstdut;  
 
  
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        e      = env::type_id::create("env",this);
        wdata  = write_data::type_id::create("wdata");
        rdata  = read_data::type_id::create("rdata");
        rstdut = reset_dut::type_id::create("rstdut");
    endfunction
 
    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        rstdut.start(e.a.seqr);
        wdata.start(e.a.seqr);
        rdata.start(e.a.seqr);
        phase.drop_objection(this);
    endtask


    //------------------------------------
    // print topology
    //------------------------------------
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        $display("--------------------------------------------------------------",);
        $display("--------------------------------------------------------------",);
        `uvm_info("other_test","start of Elaboration Phase Executed", UVM_NONE);
        uvm_top.print_topology();
        `uvm_info("other_test","End of Elaboration Phase Executed", UVM_NONE);
    endfunction


    //------------------------------------
    // report error pass or fail
    //------------------------------------
    function void report_phase(uvm_phase phase);
        uvm_report_server svr;
        super.report_phase(phase);
   
        svr = uvm_report_server::get_server();
        if(svr.get_severity_count(UVM_FATAL)+svr.get_severity_count(UVM_ERROR)>0) begin
            `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
            `uvm_info(get_type_name(), "----            TEST FAIL          ----", UVM_NONE)
            `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
        end
        else begin
            `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
            `uvm_info(get_type_name(), "----           TEST PASS           ----", UVM_NONE)
            `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
        end
    endfunction


endclass