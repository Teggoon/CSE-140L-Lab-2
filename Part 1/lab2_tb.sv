// testbench for lab2 -- alarm clock
`include "display_tb.sv"
module lab2_tb();
  logic Reset = 1,
        Clk = 0,
        Timeset = 0,
        Alarmset = 0,
		Minadv = 0,
		Hrsadv = 0,
		Alarmon = 1,
		Pulse = 0;
  wire[6:0] S1disp, S0disp,
            M1disp, M0disp,
	        H1disp, H0disp;
  wire Buzz;

  struct_diag sd(.*);
  initial begin
	#  2ns  Reset    = 0;
	#  1ns  Timeset  = 1;
	        Minadv   = 1;
	# 50ns  Minadv   = 0;
	       Hrsadv   = 1;
	#  7ns  Timeset  = 0;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp), .Buzz(Buzz));
	#  1ns  Alarmset = 1;
	#  8ns  Hrsadv   = 0;
	#  1ns  Minadv   = 1;
	# 10ns  Minadv   = 0;
	#  1ns  Alarmset = 0;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp), .Buzz(Buzz));
    for(int i=0; i<64; i++) 
	# 30ns  display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp),.Buzz(Buzz));
  	#1500ns  $stop;
  end 
  always begin
    #500ps Pulse = 1;
	#500ps Pulse = 0;
  end

endmodule