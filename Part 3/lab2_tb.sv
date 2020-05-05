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
		DateAdv = 0,
		MonthAdv = 0,
		Alarmon = 1,
		Pulse = 0;
		
  wire[6:0] S1disp, S0disp,
            M1disp, M0disp,
	        H1disp, H0disp, D0disp,Month1disp,Month0disp,Date1disp,Date0disp;
  wire Buzz;

  struct_diag sd(.*); // (.Reset(Reset),....)
  initial begin
	#  2ns  Reset    = 0;
#2ns
$display("5': before setting. '010100000', Jan 1,");
    display_tb (.seg_month1(Month1disp), .seg_month0(Month0disp),.seg_date1(Date1disp), .seg_date0(Date0disp),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	#  2ns  Timeset  = 1;
			  DateAdv = 1;
			  MonthAdv = 1;
	#  22ns  MonthAdv = 0; //month: 12
   #  38ns DateAdv = 0; //date: 31
			  Timeset  = 0;
  #2ns
$display("5':after setting,'1231', manually increment date/month successful");
    display_tb (.seg_month1(Month1disp), .seg_month0(Month0disp),.seg_date1(Date1disp), .seg_date0(Date0disp),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
# 172800ns; //24hours
$display("5': '010100',passively increment date/month successful, also testing range month 1-12, date from 1");
    display_tb (.seg_month1(Month1disp), .seg_month0(Month0disp),.seg_date1(Date1disp), .seg_date0(Date0disp),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));

	#  2ns  Timeset  = 1;
			  DateAdv = 1;
			  MonthAdv = 1;
	#  2ns MonthAdv = 0;  //month 2
   #  52ns DateAdv = 0; //date: 28
			  Timeset  = 0;
			  
#2ns
$display("5'---------------testing mod-----------");
$display("testing Feb has 28 days:'0228'");
    display_tb (.seg_month1(Month1disp), .seg_month0(Month0disp),.seg_date1(Date1disp), .seg_date0(Date0disp),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));

# 172800ns; //24hours
$display("0301");
    display_tb (.seg_month1(Month1disp), .seg_month0(Month0disp),.seg_date1(Date1disp), .seg_date0(Date0disp),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));

	#  2ns  Timeset  = 1;
			  DateAdv = 1;
			  MonthAdv = 1;
	#  2ns MonthAdv = 0;  //month 4
   #  56ns DateAdv = 0; //date: 30
			  Timeset  = 0;
#2ns
$display("testing April has 30 days: '0430'");
    display_tb (.seg_month1(Month1disp), .seg_month0(Month0disp),.seg_date1(Date1disp), .seg_date0(Date0disp),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
# 172800ns; //24hours
$display("5 points: 0501");
    display_tb (.seg_month1(Month1disp), .seg_month0(Month0disp),.seg_date1(Date1disp), .seg_date0(Date0disp),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	 
	// #100ns  $stop; modelsim will not open the testbench file after simulation
  end 
  
  
  always begin  // period is 2 ns
    #1ns Pulse = 1;
	#1ns Pulse = 0;
  end
endmodule