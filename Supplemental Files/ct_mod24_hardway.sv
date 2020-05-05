// alternative to built-in modulus operator
// what could we do to advance the z flag? 
// CSE140L   Fall 2019
module ct_mod24(
  input clk, rst, en,
  output logic[6:0] ct_out,
  output logic      z);

  always_ff @(posedge clk)
    if(rst)
	  ct_out <= 0;
	else if(en)
//	  ct_out <= (ct_out+1)%(7'd24);
      ct_out <= ct_out==23? 0 : ct_out + 1;
  always_comb z = !ct_out;
//  always @(ct_out)
//    z = !ct_out;
endmodule