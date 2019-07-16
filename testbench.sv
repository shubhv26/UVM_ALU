`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface.sv"
`include "test.sv"

module tbench_top;
    
  //clock and reset signal declaration
  bit clk;
  bit reset; 
 
  //clock generation
  always #5 clk = ~clk;
   
  //reset Generation
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  alu_inf intf(clk,reset);
  
      ALU DUT (
   			  .clk(intf.clk),
    		  .reset(intf.reset),
    		  .A(intf.A),
    		  .B(intf.B),
    		  .Result(intf.Result),
   			  .sel(intf.sel));
  
  initial begin
    uvm_config_db#(virtual alu_inf)::set(uvm_root::get(),"*","vif",intf);
  end
   
  initial begin
    run_test("test");
  end
endmodule
