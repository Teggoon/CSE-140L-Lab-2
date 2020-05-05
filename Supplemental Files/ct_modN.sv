// moduo N counter
module ct_modN #(parameter N=60)(
  input clk, 
        rst,                       // 1: reset 
        en,					       // 1: advance
  output logic[$clog2(N)-1:0] ct_out,
  output logic                z);  // "carry flag"

  always_ff @(posedge clk)
    if(rst)
	  ct_out <= 0;
	else if(en) 
	  ct_out <= (ct_out+1)%N;
  assign z = ct_out==(N-1);	 // Boolean

endmodule
