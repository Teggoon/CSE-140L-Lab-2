// task which drives six consecutive 7=segment displays
// $fdisplay performs a return / new line feed; $fwrite does not
task display_tb(input[6:0] seg_d,
  seg_e, seg_f, seg_g, seg_h, seg_i, Buzz
  );
   begin
 // segment A
      if(seg_d[6]) $write(" _ ");
      else         $write("   ");
      $write(" ");
	  if(seg_e[6]) $write(" _ ");
	  else         $write("   ");
	  $write("  ");
	  if(seg_f[6]) $write(" _ ");
	  else         $write("   ");
      $write(" ");
	  if(seg_g[6]) $write(" _ ");
	  else         $write("   ");
/*	  $write("  ");
	  if(seg_h[6]) $write(" _ ");
	  else         $write("   ");
      $write(" ");
	  if(seg_i[6]) $write(" _ ");
	  else         $write(" ");
*/
      $display("");	   
// segments FGB
      if(seg_d[1]) $write("|");
	  else $write(" ");
	  if(seg_d[0]) $write("_");
	  else $write(" ");
	  if(seg_d[5]) $write("|");
	  else $write(" ");

	  $write(" ");
	  if(seg_e[1]) $write("|");
	  else $write(" ");
	  if(seg_e[0]) $write("_");
	  else $write(" ");
	  if(seg_e[5]) $write("|");
	  else $write(" ");

	  $write("  ");
	  if(seg_f[1]) $write("|");
	  else $write(" ");
	  if(seg_f[0]) $write("_");
	  else $write(" ");
	  if(seg_f[5]) $write("|");
	  else $write(" ");

	  $write(" ");
	  if(seg_g[1]) $write("|");
	  else $write(" ");
	  if(seg_g[0]) $write("_");
	  else $write(" ");
	  if(seg_g[5]) $write("|");
	  else $write(" ");
	  $display("");
  // segments EDC
      if(seg_d[2]) $write("|");
	  else $write(" ");
	  if(seg_d[3]) $write("_");
	  else $write(" ");
	  if(seg_d[4]) $write("|");
	  else $write(" ");

	  $write(" ");
      if(seg_e[2]) $write("|");
	  else $write(" ");
	  if(seg_e[3]) $write("_");
	  else $write(" ");
	  if(seg_e[4]) $write("|");
	  else $write(" ");

	  $write("  ");
      if(seg_f[2]) $write("|");
	  else $write(" ");
	  if(seg_f[3]) $write("_");
	  else $write(" ");
	  if(seg_f[4]) $write("|");
	  else $write(" ");

	  $write(" ");
      if(seg_g[2]) $write("|");
	  else $write(" ");
	  if(seg_g[3]) $write("_");
	  else $write(" ");
	  if(seg_g[4]) $write("|");
	  else $write(" ");
	  if(Buzz) $display("   BUZZ!!!");
	  $display("");
//	  $fclose("list.txt");
	end
endtask