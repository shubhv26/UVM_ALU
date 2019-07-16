class seq_item extends uvm_sequence_item;
   rand bit[3:0] A;
  rand bit[3:0] B; 
  randc bit [2:0] sel;
  bit [3:0] Result;
  
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(A,UVM_ALL_ON)
  `uvm_field_int(B,UVM_ALL_ON)
  `uvm_field_int(sel,UVM_ALL_ON)
  `uvm_field_int(Result,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name= "seq_item");
    super.new(name);
  endfunction
  	
  constraint cons{B<A;};
  
endclass
