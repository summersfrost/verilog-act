module shift_register (Clk,nReset,Load,ShiftR,Sin,Din,Sout);
    input wire Clk;
    input wire nReset;
    input wire Load;
    input wire ShiftR;
    input wire Sin;
    input wire [7:0] Din;
    output wire Sout;

    reg [7:0] shift_reg;

    always @(posedge Clk ) begin
        if (~nReset)
            shift_reg <= 8'b0;
        else if (Load)
            shift_reg <= Din;
        else if (ShiftR)
            shift_reg <= {Sin, shift_reg[7:1]};
    end

    assign Sout = shift_reg[0];
endmodule


module test_shift_register;
    reg Clk;
    reg nReset;
    reg Load;
    reg ShiftR;
    reg Sin;
    reg [7:0] Din;
    wire Sout;

    // Instantiate the shift register
    shift_register u1 (
        .Clk(Clk),
        .nReset(nReset),
        .Load(Load),
        .ShiftR(ShiftR),
        .Sin(Sin),
        .Din(Din),
        .Sout(Sout)
    );

    // Clock generator
    always begin
        #5 Clk = ~Clk;
    end

    // Stimulus generator
    initial begin
	$dumpfile("seq1.vcd");
		$dumpvars;
        Clk = 0;
        nReset = 0; Load = 0; ShiftR = 0; Sin = 0; Din = 0;
        #10;
        nReset = 1;
        #10;
        Load = 1; Din = 8'b10101010;
        #10;
        Load = 0; ShiftR = 1; Sin = 1;
		#5
		Sin =0;
		#5 
		Sin = 1;
		#5
		nReset =0;
		Load=1;
		
        #50;
        $finish;
    end
endmodule
