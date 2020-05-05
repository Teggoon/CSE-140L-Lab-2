// task which drives six consecutive 7=segment displays
// $fdisplay performs a return / new line feed; $fwrite does not
task display_tb(input[6:0] seg_d,
  seg_e, seg_f, seg_g, seg_h, seg_i, Buzz
  );
   int h1;
   begin
    h1=$fopen("list.txt");
 // segment A
      if(seg_d[6]) $fwrite(h1," _ ");
      else         $fwrite(h1,"   ");
      $fwrite(h1," ");
	  if(seg_e[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
	  $fwrite(h1,"  ");
	  if(seg_f[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
      $fwrite(h1," ");
	  if(seg_g[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
	  $fwrite(h1,"  ");
	  if(seg_h[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
      $fwrite(h1," ");
	  if(seg_i[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1," ");

      $fdisplay(h1,"");	   

// segments FGB
      if(seg_d[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_d[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_d[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1," ");
	  if(seg_e[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_e[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_e[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1,"  ");
	  if(seg_f[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_f[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_f[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1," ");
	  if(seg_g[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_g[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_g[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1,"  ");
	  if(seg_h[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_h[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_h[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1," ");
	  if(seg_i[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_i[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_i[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fdisplay(h1,"");

  // segments EDC
      if(seg_d[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_d[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_d[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1," ");
      if(seg_e[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_e[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_e[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1,"  ");
      if(seg_f[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_f[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_f[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1," ");
      if(seg_g[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_g[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_g[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1,"  ");
      if(seg_h[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_h[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_h[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");

	  $fwrite(h1," ");
      if(seg_i[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_i[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_i[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(Buzz) $fdisplay(h1,"   BUZZ!!!");

	  $fdisplay(h1,"");


	end
endtask