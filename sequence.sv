
class alu_sequence extends uvm_sequence#(seq_item);
  `uvm_object_utils(alu_sequence)
      
  function new(string name = "alu_sequence");
    super.new(name);
  endfunction
  
  virtual task body(); 
    repeat(20) begin
    req=seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
    finish_item(req);
    end
  endtask
   
endclass

