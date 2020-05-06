// CSE140L  Fall 2019
// see Structural Diagram in Lab2.pdf
module struct_diag(
  input Reset,
        Timeset, 	  // manual buttons
        Alarmset,	  //	(five total)
		Minadv,
		Hrsadv,
		Alarmon,
		Pulse,		  // assume 1/sec.
// 6 decimal digit display (7 segment)
  output [6:0] S1disp, S0disp, 
    M1disp, M0disp, H1disp, H0disp,
  output logic Buzz);	  // alarm sounds
  
  logic[6:0] TSec, TMin, THrs, AMin, AHrs;
  logic[6:0] Min, Hrs;
  logic Szero, Mzero, Hzero, TMen, THen, AMen, AHen; 

  
  
// free-running seconds counter
  ct_mod60 Sct(
    .clk(Pulse), .rst(Reset), .en(!Timeset && !Alarmset), .ct_out(TSec), .z(Szero)
    );

	assign TMen = (!Alarmset) && ( Szero || (Timeset && Minadv) );
	 
// minutes counter -- runs at either 1/sec or 1/60sec
  ct_mod60 Mct(
    .clk(Pulse), .rst(Reset), .en(TMen), .ct_out(TMin), .z(Mzero)
    );

	assign THen = (!Alarmset) && ( (Mzero && Szero) || (Timeset && Hrsadv) );
	
// hours counter -- runs at either 1/sec or 1/60min
  ct_mod24 Hct(
	.clk(Pulse), .rst(Reset), .en(THen), .ct_out(THrs), .z(Hzero)
    );

	 
	 
	 
	 assign AMen = (!Timeset && Alarmset && Minadv);
	 
// alarm set registers -- either hold or advance 1/sec
  ct_mod60 Mreg(
    .clk(Pulse), .rst(Reset), .en(AMen), .ct_out(AMin), .z()
    ); 
	 
	
	assign AHen = (!Timeset && Alarmset && Hrsadv);

  ct_mod24 Hreg(
    .clk(Pulse), .rst(Reset), .en(AHen), .ct_out(AHrs), .z()
    ); 

	 always_comb begin
		if(Timeset) begin
			Min = TMin;
			Hrs = THrs;
		end
		else begin
			if(Alarmset) begin
				Min = AMin;
				Hrs = AHrs;
			end
			else begin
				Min = TMin;
				Hrs = THrs;
			end
		end
	 end

// display drivers (2 digits each, 6 digits total)
  lcd_int Sdisp(
    .bin_in (TSec)  ,
	.Segment1  (S1disp),
	.Segment0  (S0disp)
	);

  lcd_int Mdisp(
    .bin_in (Min) ,
	.Segment1  (M1disp),
	.Segment0  (M0disp)
	);

  lcd_int Hdisp(
    .bin_in (Hrs),
	.Segment1  (H1disp),
	.Segment0  (H0disp)
	);


// buzz off :)
  alarm a1(
    .tmin(TMin), .amin(AMin), .thrs(THrs), .ahrs(AHrs), .enable(Alarmon), .buzz(Buzz)
	);

endmodule