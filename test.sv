`include "environment.sv"

class test extends uvm_test;
  `uvm_component_utils(test)
  
  alu_sequence seq;
  env ENV;
  
  function new(string name= "test", uvm_component parent=null);
    super.new(name,parent);
  endfunction:new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    seq=alu_sequence::type_id::create("seq");
    ENV=env::type_id::create("ENV",this);
  endfunction : build_phase
  
    task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      
      seq.start(ENV.agnt.alu_sqncr);
      
      phase.drop_objection(this);
    endtask:run_phase
    
endclass:test
    	
