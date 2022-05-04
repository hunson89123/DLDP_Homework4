module bcd(clk, rst_syn, load, D_in, Q_out, S_out);
input clk;
input rst_syn;
input load;
input [3:0] D_in;
output [3:0] Q_out;
output [7:0] S_out;
wire [3:0] Q_out;
wire [7:0] S_out;
reg Q1, Q2, Q3, Q4;

dff_1 q4(clk, Q4, D_in[3], load, Q_out[3]);
dff_2 q3(clk, Q3, D_in[2], load, Q_out[2]);
dff_3 q2(clk, Q2, D_in[1], load, Q_out[1]);
dff_4 q1(clk, Q1, D_in[0], load, Q_out[0]);

always@ (posedge clk)
begin
    if (!rst_syn)
    begin
        Q4 = 0;
        Q3 = 0;
        Q2 = 0;
        Q1 = 0;
    end
    else if (load)
    begin
        Q4 = D_in[3];
        Q3 = D_in[2];
        Q2 = D_in[1];
        Q1 = D_in[0];
    end
    else if (Q1 == 1 && Q2 == 0 && Q3 == 0 && Q4 == 1)
    begin
        Q1 <= ~Q1;
        Q4 <= ~Q4;
    end
    else
    begin
        Q1 <= ~Q1;
        Q2 <= Q1? ~Q2 : Q2;
        Q3 <= Q2? (Q1? ~Q3 : Q3) : Q3;
        Q4 <= Q3? (Q2? (Q1? ~Q4 : Q4) : Q4) : Q4;
    end
end


seg7 SEG7(Q_out, S_out);
endmodule
