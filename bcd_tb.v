module clkgen(clk, clk_out);
input clk;
output clk_out;
reg clk_out;
always @(clk)
begin
    clk_out = clk;
end
endmodule

    module bcd_tb;
reg clk, load, rst_syn;
reg [3:0] D_in;
wire clk_out;
wire [3:0] Q_out;
wire [7:0] S_out;
integer i;
clkgen CLKGEN(clk, clk_out);
bcd BCD(clk_out, rst_syn, load, D_in, Q_out, S_out);

initial
    clk = 1'b1;
always
    #10 clk = ~clk;

initial
begin
    $dumpfile("bcd.vcd");
    $dumpvars(0, BCD);
    #0 load = 0;
    rst_syn = 0;
    D_in = 4'b1000;
    #20 load = 0;
    rst_syn  = 0;
    D_in = 4'b1000;
    #20 load = 1;
    rst_syn  = 1;
    D_in = 4'b1000;
    for(i = 0; i<10; i=i+1)
    begin
        #20 load = 0;
        rst_syn = 1;
    end
    #20 $finish;
end
endmodule
