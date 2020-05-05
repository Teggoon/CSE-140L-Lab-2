// CSE 140L  Fall 2019
// What happens when the count reaches maximum (= ____?) or minimum (= ____?)
// what if LD and EN are asserted at the same time? Are they active low or high?
module counter8
 (input CLK, CLR, LD, EN, UP, 
  input[7:0] D, 
  output logic[7:0] Q);
  
  always_ff @(posedge CLK)
    if(CLR)
	  Q <= 0;
	else if(!LD)
	  Q <= D;
	else if(!EN)
	  Q <= UP? Q+1 : Q-1;
  
endmodule   