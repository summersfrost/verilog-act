module halfAdder(X, Y, S, C);
  input X, Y;
  output C, S;
  xor(S, X, Y);
  and(C, X, Y);
endmodule

module fullAdder(X, Y, Z, S, C);
  input X, Y, Z;
  output C, S;
  wire sumWire, carryWire, carryWire1;
  
  halfAdder ha0(X, Y, sumWire, carryWire);
  halfAdder ha1(sumWire, Z, S, carryWire1);
  or(C, carryWire, carryWire1);
endmodule


module fullAdder_stimulus_generator(x,y,z);
	output reg x,y,z;
	
	initial
	begin
		x=0;
		y=0;
		z=0;
		
		$dumpfile("fullAdder.vcd");
		$dumpvars;
		
		x=0; y=0; z=0;
		#2
		x=0; y=0; z=1;
		#2
		x=0; y=1; z=0;
		#2
		x=0; y=1; z=1;
		#2
		x=1; y=0; z=0;
		#2
		x=1; y=0; z=1;
		#2
		x=1; y=1; z=0;
		#2
		x=1; y=1; z=1;
		#2
		
		$finish;
	end
endmodule


module fullAdder_testbench();
	wire X,Y,Z;

	fullAdder FA(X,Y,Z,S1,C1);
	fullAdder_stimulus_generator FASG(X,Y,Z);
endmodule		
