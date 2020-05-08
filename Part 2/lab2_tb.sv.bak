// testbench for lab2
`include "display_tb.sv"
module lab2_tb();
  logic Reset = 1,
        Clk = 0,
        Timeset = 0,
        Alarmset = 0,
		Minadv = 0,
		Hrsadv = 0,
		Dayadv = 0,
		Alarmon = 1,
		Pulse = 0;
		
  wire[6:0] S1disp, S0disp,
            M1disp, M0disp,
	        H1disp, H0disp, D0disp;
  wire Buzz;

  struct_diag sd(.*); // (.Reset(Reset),....)
  initial begin
    $monitor("buzz = %b %t",Buzz,$time);
	#  2ns  Reset    = 0;
#2ns
$display("5':current time before setting:'00000', only 1 day digit, all initial values are 0");
    display_tb (.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	#  2ns  Timeset  = 1;
	        Minadv   = 1;
	# 110ns  Minadv   = 0;   //Minadv has passed 50
	       Hrsadv   = 1;
	#  14ns    // Hrsadv has passed 7
		Hrsadv   = 0;
		Dayadv = 1;
		#8ns Dayadv = 0; 
		Timeset  = 0;
#2ns
$display("5':current time after setting,'40750', increment day successful");
    display_tb (.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
#2ns  Alarmset = 1; 
#2ns
$display("display alarm time before setting:'40000', alarm digits does not affect day digit");
    display_tb (.seg_j(D0disp),.seg_d(H1disp),    //display the alarm time
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	#  10ns  Hrsadv   = 1;
	#  16ns  Minadv   = 1;   //alarm hour: 8
		Hrsadv = 0;
	# 2ns  Minadv   = 0;  // alarm min 1
#2ns
$display("display alarm time after setting:'40801',alarm buzz at 0801");
    display_tb (.seg_j(D0disp),.seg_d(H1disp),    //display the alarm time
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	#  2ns  Alarmset = 0;
#2ns  
$display("display current time after setting alarm");
    display_tb (.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	#120ns;//1 min
	#120ns;#120ns;
	#120ns;
	display_tb (.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
		#120ns;
		$display("Buzz on Friday.");
	display_tb (.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	 	#120ns;
	display_tb (.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	//# 7200ns; //1 hour
	# 172800ns; //24hours
	$display("5': Day increase successfully by hours reaching 24");
		display_tb (.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
# 172800ns; //24hours
	display_tb (.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
# 172800ns; //24hours
$display("5':Buzz on Friday(4), but not on Sat and Sun (5,6), Buzz again on Mon 0.");
	display_tb (.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
  //	#3000ns  $stop;
  end 
  always begin  // period is 2 ns
    #1ns Pulse = 1;
	#1ns Pulse = 0;
  end
endmodule