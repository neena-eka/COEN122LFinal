//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Will Maddrey
// 
// Create Date: 10/01/2019 02:22:41 PM
// Design Name: Lab 1 Mux
// Module Name: mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// Final Project ALU module

module ALU(A,B,add,neg,sub,out,Z,N);

input [31:0] A;
input [31:0] B;
input add, neg, sub;

output [31:0] out;
output Z, N;

wire [31:0] threeMuxA;
wire [31:0] threeMuxB;
wire [31:0] twoCompWireA;
wire [31:0] twoCompWireB;
wire add_not,neg_not,sub_not;
wire [1:0] threeSelectA;
wire [1:0] threeSelectB;
wire cout;

not(add_not,add);
not(neg_not,neg);
not(sub_not,sub);

and(threeSelectA[1],add_not,neg_not,sub);
and(threeSelectA[0],add_not,neg,sub_not);
and(threeSelectB[1], add_not, neg, sub_not);
and(threeSelectB[0], add, neg, sub);

twoComp twoCompGenA(A,twoCompWireA);
twoComp twoCompGenB(B,twoCompWireB);

threeToOne mux_A(A,twoCompWireA,threeSelectA,threeMuxA);

threeToOne mux_B(B,twoCompWireB, threeSelectB,threeMuxB);

fullAdder addr(threeMuxA, threeMuxB,cout, out);

nor(Z,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15],out[16],out[17],out[18],out[19],out[20],out[21],out[22],out[23],out[24],out[25],out[26],out[27],out[28],out[29],out[30],out[31]);
assign N = out[31];

endmodule
