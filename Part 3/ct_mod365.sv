module ct_mod365(
  input clk, rst, en,
  output logic[4:0] outDay, outMonth);
  logic[8:0] daycount;
  
  
  
  always_ff @(posedge clk)
  
    if (rst) begin
	  outDay <= 1;
		outMonth <= 1;
		daycount = 1;
		end
	
	else if(en) begin
    
	 daycount <= (daycount+1)%365;
    if (daycount < 31) begin
      outMonth = 1;
      outDay = daycount + 1;
    end
    
	 else if (daycount < 31 + 28) begin
      outMonth = 2;
      outDay = daycount - 31 + 1;
    end
    
	 else if (daycount < 31 + 28 + 31) begin
      outMonth = 3;
      outDay = daycount - 31 - 28 + 1;
    end
    else if (daycount < 31 + 28 + 31 + 30) begin
      outMonth = 4;
      outDay = daycount - 31 - 28 - 31 +1;
    end
    else if (daycount < 31 + 28 + 31 + 30 + 31) begin
      outMonth = 5;
      outDay = daycount - 31 - 28 - 31 - 30 + 1;
    end
    else if (daycount < 31 + 28 + 31 + 30 + 31 + 30) begin
      outMonth = 6;
      outDay = daycount - 31 - 28 - 31 - 30 - 31 + 1;
    end
    else if (daycount < 31 + 28 + 31 + 30 + 31 + 30 + 31) begin
      outMonth = 7;
      outDay = daycount - 31 - 28 - 31 - 30 - 31 - 30 + 1;
    end
    else if (daycount < 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31) begin
      outMonth = 8;
      outDay = daycount - 31 - 28 - 31 - 30 - 31 - 30 - 31 + 1;
    end
    else if (daycount < 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30) begin
      outMonth = 9;
      outDay = daycount - 31 - 28 - 31 - 30 - 31 - 30 - 31 - 31 + 1;
    end
    else if (daycount < 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31) begin
      outMonth = 10;
      outDay = daycount - 31 - 28 - 31 - 30 - 31 - 30 - 31 - 31 - 30 + 1;
    end
    else if (daycount < 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30) begin
      outMonth = 11;
      outDay = daycount - 31 - 28 - 31 - 30 - 31 - 30 - 31 - 31 - 30 - 31 + 1;
    end
    else if (daycount < 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + 31) begin
      outMonth = 12;
      outDay = daycount - 31 - 28 - 31 - 30 - 31 - 30 - 31 - 31 - 30 - 31 - 30 + 1;
    end
  
	end
  
  endmodule