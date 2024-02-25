module halfAdder(X,Y,S,C);
	input X,Y;
	output C,S;
	
	xor (S,X,Y);
	and(C,X,Y);
	
endmodule

module fullAdder(X,Y,Z,S,C);
	input X,Y,Z;
	output C,S;
	wire sumWire,carryWire;
	
	halfAdder ha0(x,y,sumWire,carryWire);
	halfAdder ha1(sumWire,Z,carryWire1,S);
	or(C,carryWire,carryWire1);
	
endmodule
/*
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
*/
module gatelevel_stimulus_generator(x,y);
	output reg x,y;
		
	initial
	begin
		
		x=0;
		y=0;
		
		$dumpfile("testv.vcd");
		$dumpvars;
		x=0; y=0; 
		#2
		x=0; y=1; 
		#2
		x=1; y=0; 
		#2
		x=1; y=1; 
		#2
		
		$finish;
	end
endmodule

module fullAdder_testbench();
	wire X,Y;
	halfAdder ha(X,Y,S,C);

	gatelevel_stimulus_generator GASG(X,Y);
endmodule		
