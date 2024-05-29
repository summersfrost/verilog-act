module counter4(clk,nReset,enable,cntby2,count);
    input wire clk;
    input wire nReset;
    input wire enable;
    input wire cntby2;
    output reg [3:0] count;


always @(posedge clk or negedge nReset) begin
    if (!nReset) begin
        count <= 4'b0000;
    end
    else if (enable) begin
        if (cntby2) begin
            count <= count + 2;
        end
        else begin
            count <= count + 1;
        end
    end
end

endmodule

// Simulation testbench
module counter4_tb;

reg clk;
reg nReset;
reg enable;
reg cntby2;
wire [3:0] count;

counter4 dut (
    .clk(clk),
    .nReset(nReset),
    .enable(enable),
    .cntby2(cntby2),
    .count(count)
);

initial begin
    $dumpfile("seq2.vcd");
    $dumpvars(0, counter4_tb);

    clk = 0;
    nReset = 0;
    enable = 0;
    cntby2 = 0;
    #10 nReset = 1;
end

always #5 clk = ~clk;

initial begin
    #10 
	enable = 1;

    #20 
	cntby2 = 1;
	
    #10 enable = 0;
	#10 nReset=0;
	#10 nReset=1;
    #20 enable = 1;
    # 10
	$finish;
end


endmodule
