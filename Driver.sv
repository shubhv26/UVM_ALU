`define DRIV_IF vif.DRIVER.driver_cb

class driver extends uvm_driver#(seq_item);
  `uvm_component_utils(driver)
  
  virtual alu_inf vif;
 
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //////////////   BUILD PHASE   //////////////////////////////
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_inf)::get(this,"", "vif",vif))
      `uvm_fatal("No vif found", {"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
  
  //////////////   RUN PHASE   //////////////////////////////
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      seq_item_port.item_done();
    end
  endtask: run_phase
 
  //////////////   DRIVE() TASK   //////////////////////////////
  
  virtual task drive();
   // @(posedge vif.DRIVER.clk);
    @(posedge vif.clk);
 //   `DRIV_IF.A<=req.A;
 //   `DRIV_IF.B<=req.B;
 //   `DRIV_IF.sel<=req.sel;
    vif.A<=req.A;
    vif.B<=req.B;
    vif.sel<=req.sel;
    repeat(2)
       @(posedge vif.clk);
    req.Result<=vif.Result;
  endtask: drive
  
endclass: driver
    

