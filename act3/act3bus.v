module bus1(A,B,C,D,out);
	input A,B,C,D;
	output out;
	wire [1:0]wireOut;
	and(wireOut[1],A,B);
	or(wireOut[0],C,D);
	and(out,wireOut[1],wireOut[0]);
	
endmodule

module top(A,B,C,D,out);
	input A,B,C,D;
	wire [1:0]wireOut;
	output out;
	bus1 sec1(A,B,C,D,wireOut[1]);
	bus1 sec2(C,D,A,B,wireOut[0]);
	or(out,wireOut[1],wireOut[0]);
endmodule

module act3bus_stimulus_generator(A,B,C,D);
	output reg A,B,C,D;
		
	initial
	begin
		
		A=0;
		B=0;
		C=0;
		D=0;
		
		$dumpfile("act3bus.vcd");
		$dumpvars;
		A=0; B=0; C=0;D=0;
		#2
		A=0; B=0; C=0;D=1;
		#2
		A=0; B=0; C=1;D=0;
		#2
		A=0; B=0; C=1;D=1;
		#2
		A=0; B=1; C=0;D=0;
		#2		
		A=0; B=1; C=0;D=1;
		#2		
		A=0; B=1; C=1;D=0;
		#2		
		A=0; B=1; C=1;D=1;
		#2	
		A=1; B=0; C=0;D=0;
		#2	
		A=1; B=0; C=0;D=1;
		#2	
		A=1; B=0; C=1;D=0;
		#2	
		A=1; B=0; C=1;D=1;
		#2	
		A=1; B=1; C=0;D=0;
		#2	
		A=1; B=1; C=0;D=1;
		#2			
		A=1; B=1; C=1;D=0;
		#2	
		A=1; B=1; C=1;D=1;
		#2	
		$finish;
	end
endmodule

module act3bus_testbench();
	wire A,B,C,D;
	
	top gl(A,B,C,D,out);
	act3bus_stimulus_generator bus(A,B,C,D);
endmodule