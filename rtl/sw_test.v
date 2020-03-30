`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 16:31:34
// Design Name: 
// Module Name: sw_test
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
module sw_test
(
	input [9:0] sw_i,
	output [6:0] led_0
);

reg[6:0] DC1;
reg [6:0] DC2;
reg [6:0] DC_DEC;
reg [3:0] MP;

assign led_0 = DC_DEC;

always @(*) begin
	case (MP)
	4'd0: DC_DEC <= 7'b1000000;
	4'd1: DC_DEC <= 7'b1111001;
	4'd2: DC_DEC <= 7'b0100100;
	4'd3: DC_DEC <= 7'b0110000;
	4'd4: DC_DEC <= 7'b0011001;
	4'd5: DC_DEC <= 7'b0010010;
	4'd6: DC_DEC <= 7'b0000010;
	4'd7: DC_DEC <= 7'b1111000;
	4'd8: DC_DEC <= 7'b0000000;
	4'd9: DC_DEC <= 7'b0010000;
	default: DC_DEC <= 7'b1111111;
	endcase
end

always @(*) begin
	case (sw_i[9:8])
	2'b00: MP <= DC1;
	2'b01: MP <= DC2;
	2'b10: MP <= f;
	2'b11: MP <= sw_i[3:0];
	default: MP <= 4'b0000;
	endcase
end

always @(*) begin
	case (sw_i[3:0])
		4'b0000: DC1 <= 4'd0;
		4'b0001: DC1 <= 4'd1;
		4'b0010: DC1 <= 4'd1;
		4'b0100: DC1 <= 4'd1;
		4'b1000: DC1 <= 4'd1;
		4'b0011: DC1 <= 4'd2;
		4'b1100: DC1 <= 4'd2;
		4'b0110: DC1 <= 4'd2;
		4'b0101: DC1 <= 4'd2;
		4'b1001: DC1 <= 4'd2;
		4'b1010: DC1 <= 4'd2;
		4'b0111: DC1 <= 4'd3;
		4'b1110: DC1 <= 4'd3;
		4'b1101: DC1 <= 4'd3;
		4'b1011: DC1 <= 4'd3;
		4'b1111: DC1 <= 4'd4;
		
	endcase
end

always @(*) begin
	DC2 <= sw_i[7:4] << 1;
end

assign f = (sw_i[0] | sw_i[1] | sw_i[2]) & sw_i[3];

endmodule