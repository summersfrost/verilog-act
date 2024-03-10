module halfAdderAssign(A,B,C,S);
	input A,B;
	output C,S;
	wire w1,w2;

assign S=A^B;
assign C=A&B;
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
	
	halfAdderAssign HA(A,B,C,S);
	gatelevel_stimulus_generator GLSG(A,B);
endmodule			
			
			