module adder(
    input a, b, cin,
    output y, cout
);
assign y = a ^ b ^ cin;
assign cout = (a & b) | ((a ^ b) & cin);
endmodule

module fourbitadd(
    input [3:0] fa, fb,
    input fcin,
    output [3:0] fy,
    output fcout
);
    wire [2:0] temp;

    adder u0 (.a(fa[0]), .b(fb[0]), .cin(fcin),    .y(fy[0]), .cout(temp[0]));
    adder u1 (.a(fa[1]), .b(fb[1]), .cin(temp[0]), .y(fy[1]), .cout(temp[1]));
    adder u2 (.a(fa[2]), .b(fb[2]), .cin(temp[1]), .y(fy[2]), .cout(temp[2]));
    adder u3 (.a(fa[3]), .b(fb[3]), .cin(temp[2]), .y(fy[3]), .cout(fcout));
endmodule
