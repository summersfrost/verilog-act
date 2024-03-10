module fullAdderAssign(A,B,C,S,Cout);
	input A,B,C;
	output Cout,S;
	wire w1,w2;

assign S=A^B^C;
assign Cout = (A & B) | (C & (A ^ B));
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

	fullAdderAssign FA(X,Y,Z,S,C);
	fullAdder_stimulus_generator FASG(X,Y,Z);
endmodule	