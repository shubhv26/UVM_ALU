interface alu_inf( input logic clk, reset);

  logic[3:0] A;
  logic[3:0] B; 
  logic [2:0] sel;
  logic [3:0] Result;
  
  clocking driver_cb @(posedge clk);
    default input #1 output #1;
  output  A;
  output  B; 
  output  sel;
  input  Result;
  endclocking
  
  clocking monitor_cb @(posedge clk);
    default input #1 output #1;
  input  A;
  input  B; 
  input  sel;
  input  Result;
  endclocking 
  
  modport DRIVER (clocking driver_cb, input clk,reset);
    modport MONITOR (clocking monitor_cb, input clk,reset);
      
      endinterface
      
