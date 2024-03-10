module busAssign(A,B,C,D,out);
	input A,B,C,D;
	output out;
assign out = ((A&B)&(C|D))|((C&D)&(A|B));
	
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
	
	busAssign bus(A,B,C,D,out);
	act3bus_stimulus_generator bus1(A,B,C,D);
endmodule