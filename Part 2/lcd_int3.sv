module lcd_int(
  input[6:0] bin_in,
  output logic [6:0] Segment1,
                     Segment0);

  logic[6:0] bin0;
  assign bin0 = bin_in % 10;  // mod10   LSD
  logic[6:0] bin1;
  assign bin1 = (bin_in - bin0)/10;
  
  always_comb case(bin0) 
    4'b0000 : Segment0 = 7'h7E;
    4'b0001 : Segment0 = 7'h30;
    4'b0010 : Segment0 = 7'h6D;
    4'b0011 : Segment0 = 7'h79;
    4'b0100 : Segment0 = 7'h33;          
    4'b0101 : Segment0 = 7'h5B;
    4'b0110 : Segment0 = 7'h5F;
    4'b0111 : Segment0 = 7'h70;
    4'b1000 : Segment0 = 7'h7F;
    4'b1001 : Segment0 = 7'h7B;
	default : Segment0 = 7'h00;
  endcase
    always_comb case(bin1) 
    4'b0000 : Segment1 = 7'h7E;
    4'b0001 : Segment1 = 7'h30;
    4'b0010 : Segment1 = 7'h6D;
    4'b0011 : Segment1 = 7'h79;
    4'b0100 : Segment1 = 7'h33;          
    4'b0101 : Segment1 = 7'h5B;
    4'b0110 : Segment1 = 7'h5F;
    4'b0111 : Segment1 = 7'h70;
    4'b1000 : Segment1 = 7'h7F;
    4'b1001 : Segment1 = 7'h7B;
	default : Segment1 = 7'h00;
  endcase

endmodule

