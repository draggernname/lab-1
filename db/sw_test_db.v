`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 16:36:18
// Design Name: 
// Module Name: sw_test_db
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

module sw_test_db();
wire [15:0] led;
reg[15:0] sw;
 
 sw_test DUT(
 .sw_i (sw),
 .led_0 (led)
 );
 
 initial begin
 sw = 16'b0;
    repeat(20) begin
    #5 sw = sw+(1'b1);
 end
 
 sw=16'b0100000000;
    repeat(20) begin
    #5 sw = sw+(1'b1 << 4);
 end
 
 sw=16'b1000000000;
    repeat (20) begin
    #5 sw = sw+1'b1;
 end
 
 sw=16'b1100000000;
    repeat (20) begin
    #5 sw = sw+1'b1;
 end
 end
 
 endmodule