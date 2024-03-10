module parityGenEnable(A,B,C,D,out);
	input A,B,C,D;
	output out;
wire term1, term2, term3, term4;

assign term1 = A & B & (~C) & (~D);
assign term2 = A & (~B) & (~C) & D;
assign term3 = A & B & C & D;
assign term4 = A & (~B) & C & (~D);

assign out = term1 | term2 | term3 | term4;
endmodule



module parity_stimulus_generator(A,B,C,D);
	output reg A,B,C,D;
		
	initial
	begin
		
		A=0;
		B=0;
		C=0;
		D=0;
		
		$dumpfile("parityGenEnable.vcd");
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
	
	parityGenEnable evenParity(A,B,C,D,out);
	parity_stimulus_generator parityGen(A,B,C,D);
endmodule