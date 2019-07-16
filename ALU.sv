module ALU(input logic clk, reset,
			 input logic[3:0] A,B, 
           output logic [3:0] Result,
               input logic [2:0] sel);
  
  

always@(posedge clk)
  if(!reset) begin
    case(sel)
      3'b000: Result<=A+B; //Add
      3'b001: Result<=A+(~B+1); // sub
      3'b010: Result<=A & B; // and
      3'b011: Result<=A | B; //or
      3'b100: Result<= A*B; //multiply
      3'b101: Result<=A^B; //xor
      3'b110: Result<= ~(A & B); //nand
      3'b111: Result<= ~(A | B); //nor
      default: $display("INVALID INPUT SELECTED");
    endcase
     end      
else begin
  Result<=8'bX;
  end
endmodule
