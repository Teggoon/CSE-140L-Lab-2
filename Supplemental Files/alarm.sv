// CSE140 lab 1  Summer 2018
// drives buzzer if alarm setting matches current time
module alarm #(parameter NH=24, NS=60)(
  input[$clog2(NS)-1:0] tmin,
                        amin,
  input[$clog2(NH)-1:0] thrs,
			            ahrs,
  output logic          buzz
);

  always_comb
    buzz = tmin==amin && thrs==ahrs;

endmodule