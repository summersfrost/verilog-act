module halfAdder(A,B,C,S,N1,N2);
	input A,B;
	output C,S,N1,N2;
	wire w1,w2;
	
	and G1(C,A,B);
	not G2(N1,A);
	not G3 (N2,B);
	and G4 (w1,N1,B);
	and G5 (w2,A,N2);
	or G6 (S,w1,w2);
endmodule

module gatelevel_stimulus_generator(x,y);
	output reg x,y;
		
	initial
	begin
		
		x=0;
		y=0;
		
		$dumpfile("halfAdder.vcd");
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

module gatelevel_testbench();
	wire A,B;
	
	halfAdder HA(A,B,C,S,N1,N2);
	gatelevel_stimulus_generator GLSG(A,B);
endmodule			
			
			