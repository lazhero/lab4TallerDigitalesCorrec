module muxVGAOut(input[1:0] sq_state, input sq_x,sq_o, output logic sq);
	always_comb begin
		case(sq_state)
			1'b01: sq = sq_x;
			1'b10: sq = sq_o;
			default:sq=1'b0;
		endcase
	end
endmodule 