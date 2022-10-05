module muxVGAOut(input sel, output[7:0] r_red,r_green,r_blue);
	logic [23:0] colors;
	always_comb begin
		case(sel)
			1'b0: colors = 24'b0;
			1'b1: colors = 24'hFFFFFF;
			default:colors=24'b0;
		endcase
	end
	assign r_red = colors[23:15];
	assign r_green = colors[15:7];
	assign r_blue = colors[7:0];

endmodule 