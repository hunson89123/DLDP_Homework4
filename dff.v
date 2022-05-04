module dff_1 (clk, D, Din, Load, Q4);
input clk, D, Din, Load;
output Q4;
reg Q4;
always@ (posedge clk)
    if (Load)
        Q4 = Din;
    else
        Q4 = D;
endmodule

    module dff_2 (clk, D, Din, Load, Q3);
input clk, D, Din, Load;
output Q3;
reg Q3;
always@ (posedge clk)
    if (Load)
        Q3 = Din;
    else
        Q3 = D;
endmodule

    module dff_3 (clk, D, Din, Load, Q2);
input clk, D, Din, Load;
output Q2;
reg Q2;
always@ (posedge clk)
    if (Load)
        Q2 = Din;
    else
        Q2 = D;
endmodule

    module dff_4 (clk, D, Din, Load, Q1);
input clk, D, Din, Load;
output Q1;
reg Q1;
always@ (posedge clk)
    if (Load)
        Q1 = Din;
    else
        Q1 = D;
endmodule
