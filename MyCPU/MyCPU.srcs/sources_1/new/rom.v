`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/08 16:06:48
// Design Name: 
// Module Name: rom
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


module rom(
    input [15:0] addr,
    input ena, 
    input read,
    output [15:0] data
    );
    reg [15:0] rom [255:0];
    initial begin
        //Program 1, LED
        rom[16'd42]=16'b10000_001_0000_0001;    //movih r1, 
        rom[16'd43]=16'b01111_001_1000_0000;    //movil r1, 384
        rom[16'd44]=16'b01110_000_001_00000;    //mov r0, r1
        rom[16'd45]=16'b10000_010_0000_0001;    //movih r2, 
        rom[16'd46]=16'b01111_010_1001_1110;    //movil r2, 414
        //The loop starts here
        rom[16'd47]=16'b10011_111_000_00000;    //load M[r0]->r7  30
        rom[16'd48]=16'b10100_000_111_00000;    //store r7->M[r0]
        rom[16'd49]=16'b00100_000_0000_0001;    //addi r0, 1
        rom[16'd50]=16'b00101_010_000_00000;    //cmp r2, r0
        rom[16'd51]=16'b11011_100_000_00100;    //jrnz PC-3
        rom[16'd52]=16'b10100_100_000_00000;    //store M[r4], r0
        rom[16'd53]=16'b11111_000_000_00000;    //hlt
        //sum_i=1^100
        rom[74]=16'b01111_010_0110_0101;    //movil r2, 0110 0101
        rom[75]=16'b10000_010_0000_0000;    //movih r2, 0000 0000
        rom[76]=16'b01111_000_0000_0001;    //movil r0, 0000 0001
        rom[77]=16'b10000_000_0000_0000;    //movih r0, 0000 0000
        rom[78]=16'b01111_001_0000_0010;    //movil r1, 0000 0010
        rom[79]=16'b10000_001_000_00000;    //movil r1, 0000 0000
        rom[80]=16'b00000_000_001_00000;    //adc r0, r1
        rom[81]=16'b00100_001_0000_0001;    //addi r1, 1
        //rom[82]=16'b10100_100_001_00000;    //store M[r4], r1
        rom[82]=16'b00101_010_001_00000;    //cmp r2, r1 
        rom[83]=16'b11011_100_000_00011;    //jrnz PC-3
        rom[84]=16'b01111_100_1000_0011;    //movil r4, 1000 0011
        rom[85]=16'b10000_100_0000_0001;    //movih r4, 0000 0001
        rom[86]=16'b10100_100_000_00000;    //store r4, r0
        rom[87]=16'b10100_100_000_00000;    //store r4, r0
        rom[88]=16'b10100_100_000_00000;    //store r4, r0
        rom[89]=16'b10100_100_000_00000;    //store r4, r0
        rom[90]=16'b10100_100_000_00000;    //store r4, r0
        rom[91]=16'b10100_100_000_00000;    //store r4, r0
        rom[92]=16'b11111_000_000_00000;    //hlt
    end
    assign data=(read&&ena)?rom[addr]:16'hzzzz;
endmodule
