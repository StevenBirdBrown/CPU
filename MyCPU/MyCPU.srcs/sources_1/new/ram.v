`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/08 16:08:54
// Design Name: 
// Module Name: ram
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


module ram(
    input [15:0] addr,
    input [15:0] indata,
    input ena, 
    input read,
    input write,
    output [15:0] outdata
    );
    reg [15:0] ram [767:256];
    //The songs' nodes begin at 256+128=384
    initial begin
            ram[384]=16'd31;
            ram[385]=16'd31;
            ram[386]=16'd31;
            ram[387]=16'd31;
            ram[388]=16'd13;
            ram[389]=16'd14;
            ram[390]=16'd15;
            ram[391]=16'd17;
    
            ram[392]=16'd20;
            ram[393]=16'd20;
            ram[394]=16'd20;
            ram[395]=16'd20;
            ram[396]=16'd13; 
            ram[397]=16'd14;
            ram[398]=16'd15;
            ram[399]=16'd17;
            
            ram[400]=16'd20;
            ram[401]=16'd20; 
            ram[402]=16'd20; 
            ram[403]=16'd20; 
            ram[404]=16'd23; 
            ram[405]=16'd22;
            ram[406]=16'd21;    
            ram[407]=16'd22;
    
            ram[408]=16'd20; 
            ram[409]=16'd20; 
            ram[410]=16'd20;        
            ram[411]=16'd20; 
            ram[412]=16'd20; 
            ram[413]=16'd20; 
            ram[414]=16'd20; 
            ram[415]=16'd20;
        
            ram[416]=16'd31;
            ram[417]=16'd31;
            ram[418]=16'd31;
            ram[419]=16'd31;
            ram[420]=16'd13;
            ram[421]=16'd14;
            ram[422]=16'd15;
            ram[423]=16'd17;
    
            ram[424]=16'd20;
            ram[425]=16'd20;
            ram[426]=16'd20;
            ram[427]=16'd20;
            ram[428]=16'd13; 
            ram[429]=16'd14;
            ram[430]=16'd15;
            ram[431]=16'd17;
    
            ram[432]=16'd20;
            ram[433]=16'd20; 
            ram[434]=16'd20; 
            ram[435]=16'd20; 
            ram[436]=16'd23; 
            ram[437]=16'd22;
            ram[438]=16'd21;    
            ram[439]=16'd22;
    
            ram[440]=16'd20; 
            ram[441]=16'd20; 
            ram[442]=16'd20;        
            ram[443]=16'd20; 
            ram[444]=16'd20; 
            ram[445]=16'd20; 
            ram[446]=16'd20; 
            ram[447]=16'd20;
    
            ram[448]=16'd31; 
            ram[449]=16'd31; 
            ram[450]=16'd31; 
            ram[451]=16'd31; 
            ram[452]=16'd17; 
            ram[453]=16'd19; 
            ram[454]=16'd20; 
            ram[455]=16'd24; 
    
            ram[456]=16'd23; 
            ram[457]=16'd23; 
            ram[458]=16'd23; 
            ram[459]=16'd24; 
            ram[460]=16'd23; 
            ram[461]=16'd24; 
            ram[462]=16'd23; 
            ram[463]=16'd22; 
    
            ram[464]=16'd23; 
            ram[465]=16'd23; 
            ram[466]=16'd23; 
            ram[467]=16'd23; 
            ram[468]=16'd23; 
            ram[469]=16'd24; 
            ram[470]=16'd26; 
            ram[471]=16'd24; 
    
            ram[472]=16'd19; 
            ram[473]=16'd19; 
            ram[474]=16'd19; 
            ram[475]=16'd17; 
            ram[476]=16'd19; 
            ram[477]=16'd17; 
            ram[478]=16'd19; 
            ram[479]=16'd23; 
    
            ram[480]=16'd22; 
            ram[481]=16'd22; 
            ram[482]=16'd22; 
            ram[483]=16'd22; 
            ram[484]=16'd13; 
            ram[485]=16'd14; 
            ram[486]=16'd15; 
            ram[487]=16'd17; 
    
            ram[488]=16'd20; 
            ram[489]=16'd20; 
            ram[490]=16'd20; 
            ram[491]=16'd24; 
            ram[492]=16'd20; 
            ram[493]=16'd23; 
            ram[494]=16'd24; 
            ram[495]=16'd23; 
    
            ram[496]=16'd21; 
            ram[497]=16'd21; 
            ram[498]=16'd21; 
            ram[499]=16'd21; 
            ram[500]=16'd23; 
            ram[501]=16'd22; 
            ram[502]=16'd21; 
            ram[503]=16'd22; 
    
            ram[504]=16'd20; 
            ram[505]=16'd20; 
            ram[506]=16'd20; 
            ram[507]=16'd20; 
            ram[508]=16'd20; 
            ram[509]=16'd20; 
            ram[510]=16'd20; 
            ram[511]=16'd20; 
    
            ram[512]=16'd31; 
            ram[513]=16'd31; 
            ram[514]=16'd31; 
            ram[515]=16'd31; 
            ram[516]=16'd13; 
            ram[517]=16'd14; 
            ram[518]=16'd15; 
            ram[519]=16'd17; 
    
            ram[520]=16'd20; 
            ram[521]=16'd20; 
            ram[522]=16'd20; 
            ram[523]=16'd20; 
            ram[524]=16'd13; 
            ram[525]=16'd14; 
            ram[526]=16'd15; 
            ram[527]=16'd17; 
    
            ram[528]=16'd20; 
            ram[529]=16'd20; 
            ram[530]=16'd20; 
            ram[531]=16'd20; 
            ram[532]=16'd23; 
            ram[533]=16'd22; 
            ram[534]=16'd21; 
            ram[535]=16'd22; 
    
            ram[536]=16'd20; 
            ram[537]=16'd20; 
            ram[538]=16'd20; 
            ram[539]=16'd20; 
            ram[540]=16'd31; 
            ram[541]=16'd31; 
            ram[542]=16'd31; 
            ram[543]=16'd31; 
    end
    assign outdata=(read&&ena)?ram[addr]:16'hzzzz;
    always @ (posedge write)
    begin
        ram[addr]=indata;
    end
endmodule