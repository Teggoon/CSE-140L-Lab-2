// what does this do?
// why 7 bits? would 6 suffice?
module comp7(
  input[6:0] A,B,
  output logic eq);

  assign eq = A==B;

endmodule