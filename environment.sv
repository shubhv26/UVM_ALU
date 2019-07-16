
`include "agent.sv"
`include "scoreboard.sv"

class env extends uvm_env;
  
   agent agnt;
  scoreboard scb; 
  
  `uvm_component_utils(env)
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction:new
 
  //////////////////BUILD PHASE////////////////////
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    agnt=agent::type_id::create("agnt",this);
    scb=scoreboard::type_id::create("scb",this);
  endfunction: build_phase
  
  //////////////CONNECT PHASE///////////////////////
  function void connect_phase(uvm_phase phase);
    agnt.alu_mon.item_collected_port.connect(scb.item_collected.analysis_export);
  
  endfunction: connect_phase
    
 endclass:env
    
    
