`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/10 20:05:50
// Design Name: 
// Module Name: testtop
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


module testtop(clkin, reset, hlt, sw, seg, an, clkcon,/*This is seg_sel*/run, hand,
AUD_PWM, AUD_SD,
 //for debug
//pc_ena, cu_ena, fetch, clock4,
//rd, wr, ram_sel, rom_sel, mar_ena, mdr_ena, ir_ena, state);
led);
input clkin, reset;
input [2:0] clkcon; 
input hand;
//output [6:0] seg;

//output [7:0] seg_sel; 
output hlt, run;
output [6:0] seg;
output [7:0] an;
output AUD_PWM;
output AUD_SD;
//output [1:0] io;
input [1:0] sw;
//FOR DEBUG
output [15:0] led;

wire [3:0] dis; 
wire [1:0] io;
wire clkin, reset;
wire [15:0] indata;
wire [15:0] outdata;
wire [15:0] addr;

wire rd, wr;
wire ram_sel, rom_sel;
wire hlt, run;
//for debug
wire [15:0] instr;
wire [15:0] counter;//temporarily set to 8-bit, should be 16-bit
wire pc_ena;
wire fetch;
wire cu_ena;
wire clock4;
wire mar_ena;
wire mdr_ena;
wire ir_ena;
wire [3:0] state;
wire [15:0] port;
assign led=port;//outdata;

risc_cpu MyCPU(.clkin(clkin), .reset(reset), .addr(addr), .indata(indata), .outdata(outdata),
.wr_m(wr), .rd_m(rd), .hlt(hlt), .io(io), .sw(sw), .clkcon(clkcon), .run(run), .port(port), .hand(hand),
//for debug 
.pc(counter), .ir(instr), .cu_ena(cu_ena), .fetch(fetch), .pc_ena(pc_ena), .clk(clock4),
.mar_ena(mar_ena), .mdr_ena(mdr_ena), .ir_ena(ir_ena), .state(state));

addr_decode DECODER(.addr(addr), .rom_sel(rom_sel), .ram_sel(ram_sel));

rom ROM(.data(indata), .addr(addr), .read(rd), .ena(rom_sel));

ram RAM(.indata(outdata), .outdata(indata), .addr(addr), .ena(ram_sel), .read(rd), .write(wr));

display_control DISCON(.clk(clkin), .dis(dis), .seg_sel(an), .pc(counter), .ir(instr));

display DISPLAY(.dis(dis), .seg(seg));

integralaudio IAUD(.clk(clkin), .portin(port[4:0]), .AUD_PWM(AUD_PWM), .AUD_SD(AUD_SD), .sw(sw));

endmodule
