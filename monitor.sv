
`define MON_IF vif.monitor_cb

class monitor extends uvm_monitor;
  
`uvm_component_utils(monitor)
   
  virtual alu_inf vif;
  uvm_analysis_port#(seq_item) item_collected_port;
  seq_item seq_collected;
  seq_item item_collected;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
    item_collected_port=new("item_collected_port",this);
    seq_collected=new();
  endfunction: new
  
    //////////////   BUILD PHASE   //////////////////////////////
    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_inf)::get(this,"", "vif",vif))
      `uvm_fatal("No vif found", {"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
    
  //////////////   RUN PHASE   //////////////////////////////
    virtual task run_phase(uvm_phase phase);
      forever begin
      //  @(posedge vif.MONITOR.clk);
        @(posedge vif.clk);
       // seq_collected.A=`MON_IF.A;
       // seq_collected.B=`MON_IF.B;
       // seq_collected.sel=`MON_IF.sel;
        seq_collected.A=vif.A;
        seq_collected.B=vif.B;
        seq_collected.sel=vif.sel;
        
     //  @(posedge vif.MONITOR.clk);
       @(posedge vif.clk);
   		 seq_collected.Result=vif.Result;
    //   @(posedge vif.MONITOR.clk);
       @(posedge vif.clk);
        `uvm_info(get_type_name(), $sformatf("from monitor result = 4'b%b", seq_collected.Result), UVM_MEDIUM)
	
        $cast(item_collected, seq_collected.clone());
        item_collected_port.write(item_collected);
   end
  endtask: run_phase
  
endclass: monitor
        

